package dao;

import model.Member599;
import java.sql.*;

public class MemberDao599 {

    public MemberDao599() {
    }

    public boolean isUniqueField(String fieldName, String value) throws SQLException {
        String sql = "SELECT COUNT(*) FROM tbl_member599 WHERE " + fieldName + " = ?";
        ConnectDatabase.connect();

        PreparedStatement statement = ConnectDatabase.jdbcConnection.prepareStatement(sql);
        statement.setString(1, value);

        ResultSet resultSet = statement.executeQuery();
        if (resultSet.next()) {
            int count = resultSet.getInt(1);
            return count == 0;
        }

        return false;
    }
    public boolean registerMember(Member599 member599) throws SQLException {
        if (!isUniqueField("email", member599.getEmail()) ||
                !isUniqueField("username", member599.getUsername()) ||
                !isUniqueField("phone", member599.getPhone())) {
            return false;
        }
        String sql = "INSERT INTO tbl_member599 (username, password, name, dob, email, address, phone, role) VALUES (?, ?, ?, ?, ?,?,?, ?)";
        ConnectDatabase.connect();

        PreparedStatement statement = ConnectDatabase.jdbcConnection.prepareStatement(sql);
        statement.setString(1, member599.getUsername());;
        statement.setString(2, member599.getPassword());
        statement.setString(3, member599.getName());
        statement.setDate(4, member599.getDob());
        statement.setString(5, member599.getEmail());
        statement.setString(6, member599.getAddress());
        statement.setString(7, member599.getPhone());
        statement.setString(8, "user");

        boolean rowInserted = statement.executeUpdate() > 0;
        statement.close();
        ConnectDatabase.disconnect();
        return rowInserted;
    }
    public String getUserRole(String username, String password){

        Connection conn = null;

        try {
            conn = ConnectDatabase.connect();
            String sql = "SELECT role FROM tbl_member599 WHERE username = ? AND password = ?";

            PreparedStatement statement = conn.prepareStatement(sql);

            statement.setString(1, username);
            statement.setString(2, password);

            ResultSet resultSet = statement.executeQuery();

            if (resultSet.next()) {

                String role = resultSet.getString("role");
                return role;

            }
        } catch (SQLException e) {

            e.printStackTrace();
        }

        return null;
    }

    public Member599 getMemberInfoByUsername(String username) throws SQLException {
        String sql = "SELECT * FROM tbl_member599 WHERE username = ?";
        ConnectDatabase.connect();

        PreparedStatement statement = ConnectDatabase.jdbcConnection.prepareStatement(sql);
        statement.setString(1, username);
        ResultSet resultSet = statement.executeQuery();

        if (resultSet.next()) {
            Member599 member599 = new Member599();
            member599.setId(resultSet.getInt("id"));
            member599.setUsername(username);
            member599.setName(resultSet.getString("name"));
            member599.setPhone(resultSet.getString("phone"));
            member599.setEmail(resultSet.getString("email"));
            return member599;
        }
        ConnectDatabase.disconnect();
        return null;
    }


}
