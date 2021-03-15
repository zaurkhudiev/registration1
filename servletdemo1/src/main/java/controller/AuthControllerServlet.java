package controller;

import com.fasterxml.jackson.databind.JsonNode;
import com.fasterxml.jackson.databind.ObjectMapper;
import utils.DBUtils;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.sql.ResultSet;
import java.sql.SQLException;

public class AuthControllerServlet extends HttpServlet {
    private static String AUTHORIZE_FIELD = "is_authorize";
    private static String CURRENT_USER = "current_username";

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        //DBUtils.execQuery("SELECT * FROM users");
        System.out.println("Request from browser reached the servlet...");

        HttpSession session = req.getSession();

        if (session.getAttribute(AuthControllerServlet.AUTHORIZE_FIELD) != null) {
            if (req.getParameter("action") != null && req.getParameter("action").equals("logout")) {
                session.removeAttribute(AuthControllerServlet.AUTHORIZE_FIELD);
                session.removeAttribute(AuthControllerServlet.CURRENT_USER);
            }
        }
        getServletConfig().getServletContext().getRequestDispatcher("/login.jsp").forward(req, resp);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String username = req.getParameter("email");
        String password = req.getParameter("password");
        if (username != null && password != null && username.length() > 3 && password.length() == 6) {

            try {

                ResultSet resultSet = DBUtils.query("SELECT COUNT(1) as user_exists FROM users where email = ? and password = ? LIMIT 1", new String[]{username, password});

                if (resultSet != null && resultSet.next() && resultSet.getInt("user_exists") > 0) {
                    HttpSession session = req.getSession();
                    session.setAttribute(AuthControllerServlet.AUTHORIZE_FIELD, true);
                    session.setAttribute(AuthControllerServlet.CURRENT_USER, username);
                    System.out.println("User passed authentication. Trying to forward...");
                    resp.sendRedirect("/helloworld/index.jsp");

                } else {
                    System.out.println("No user exist within system.");
                    req.setAttribute("error_message", new String[]{"No user exists within the system"});
                }
            } catch (SQLException throwables) {
                req.setAttribute("error_message", new String[]{"Error while connecting to the Database"});
                throwables.printStackTrace();
            }
        } else {
            req.setAttribute("error_message", new String[]{"Data validation error","Some other error"});
            System.out.println("Data validation error");

        }
    }


    @Override
    public void destroy() {
        super.destroy();
    }

    @Override
    public void init() throws ServletException {
        super.init();
    }
}
