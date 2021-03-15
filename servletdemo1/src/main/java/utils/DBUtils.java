package utils;

import org.w3c.dom.ls.LSOutput;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.naming.NamingException;
import javax.sql.DataSource;
import javax.swing.plaf.nimbus.State;
import java.sql.*;

public class DBUtils {

    static DataSource dataSource;

    static {
        System.out.println("Entering the block...");
        try {
            Context initContext = new InitialContext();
            Context webContext = (Context) initContext.lookup("java:/comp/env");
            dataSource = (DataSource) webContext.lookup("jdbc/ada_datasource");
        } catch (NamingException e) {
            e.printStackTrace();
        }

    }

    public static ResultSet query(String sql, String... args) throws SQLException {
        Connection connection = null;
        PreparedStatement statement = null;
        ResultSet resultSet = null;

        try {
            connection = DBUtils.dataSource.getConnection();
            statement = connection.prepareStatement(sql);
            for (int i = 0; i <= args.length - 1; i++) {
                statement.setString(i + 1, args[i]);
            }
            return statement.executeQuery();

        } catch (SQLException ex) {
            ex.printStackTrace();
        }
//        } finally {
//            if (resultSet != null) resultSet.close();
//            if (statement != null) statement.close();
//            if (connection != null) connection.close();
//
//        }
        return null;
    }

}
