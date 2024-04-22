package dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class StudentDAO {
    private static final String URL = "jdbc:h2:tcp://localhost/~/score1";
    private static final String USER = "your_username";
    private static final String PASSWORD = "your_password";

    public static Connection getConnection() throws SQLException {
        return DriverManager.getConnection(URL, USER, PASSWORD);
    }
}
