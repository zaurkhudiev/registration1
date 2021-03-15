<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>

<%
    String id = request.getParameter("user_id");
    String driverName = "org.postgresql.Driver";
    String connectionUrl = "jdbc:postgresql://localhost:5432/postgres";
    String dbName = "postgres";
    String userId = "postgres";
    String password = "zaur12";

    try {
        Class.forName(driverName);
    } catch (ClassNotFoundException e) {
        e.printStackTrace();
    }

    Connection connection = null;
    Statement statement = null;
    ResultSet resultSet = null;
%>
<h2 align="center"><strong>YOUR DATA</strong></h2>
<table align="center" cellpadding="5" cellspacing="5" border="1">
    <tr>

    </tr>
    <tr bgcolor="blue">
        <td><b>ID</b></td>
        <td><b>FIRSTNAME</b></td>
        <td><b>LASTNAME</b></td>
        <td><b>CITY</b></td>
        <td><b>COUNTRY</b></td>
        <td><b>GENDER</b></td>
    </tr>
    <%
        try{
            connection = DriverManager.getConnection(connectionUrl, userId, password);
            statement=connection.createStatement();
            String sql ="select *\n" +
                    "FROM usersinfo\n" +
                    "ORDER BY user_id DESC \n" +
                    "LIMIT 1 ";

            resultSet = statement.executeQuery(sql);
            while(resultSet.next()){
    %>
    <tr bgcolor="green">

        <td><%=resultSet.getString("user_id") %></td>
        <td><%=resultSet.getString("firstname") %></td>
        <td><%=resultSet.getString("lastname") %></td>
        <td><%=resultSet.getString("city") %></td>
        <td><%=resultSet.getString("country") %></td>
        <td><%=resultSet.getString("gender") %></td>

    </tr>
    <%
            }

        } catch (Exception e) {

        }
    %>
    <div style="float: right">
        <a href="/helloworld/auth?action=logout">Logout</a>

    </div>
    <div>
        <a href="/helloworld/auth.jsp"> REGISTRATION PAGE </a>
    </div>
</table>>
