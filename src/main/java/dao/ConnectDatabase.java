package dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class ConnectDatabase {
    private static final String JDBC_URL = "jdbc:mysql://localhost:3306/pttkht";
    private static final String JDBC_USER = "root";
    private static final String JDBC_PASSWORD = "matkhau.2010";
    public static Connection jdbcConnection;

    public static Connection connect() throws SQLException {
        try {
            if (jdbcConnection == null || jdbcConnection.isClosed()) {
                Class.forName("com.mysql.cj.jdbc.Driver");
                jdbcConnection = DriverManager.getConnection(JDBC_URL, JDBC_USER, JDBC_PASSWORD);
            }
        } catch (ClassNotFoundException e) {
            throw new SQLException(e);
        }
        return jdbcConnection;
    }

    public static void disconnect() throws SQLException {
        if (jdbcConnection != null && !jdbcConnection.isClosed()) {
            jdbcConnection.close();
        }
    }

}
