package dao;

import model.User;

import java.sql.*;

public class UserDao{

    public int regUser(User user) throws ClassNotFoundException, SQLException {


        String sqll = "INSERT INTO users" + "(user_id, email, password) VALUES" + "(?,?,?);";

        int result = 0;
        Class.forName("org.postgresql.Driver");
        try {


            Connection connection = DriverManager.getConnection("jdbc:postgresql://localhost:5432/postgres","postgres","zaur12");
            PreparedStatement prepare = connection.prepareStatement("select max(user_id)+1 from users");
            ResultSet rs = prepare.executeQuery();
            String user_id ="" ;
            while(rs.next())
            {
                user_id = rs.getString(1);
            }
            PreparedStatement preparedStatement = connection.prepareStatement(sqll);
            preparedStatement.setInt(1, Integer.parseInt(user_id));
            preparedStatement.setString(2,user.getEmail());
            preparedStatement.setString(3,user.getPassword());
            System.out.println(preparedStatement);
            result = preparedStatement.executeUpdate();
        } catch (SQLException throwables) {
            throwables.printStackTrace();
        }

return result;
    }

}
