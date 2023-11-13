package dao.LibraryStaff;

import dao.ConnectDatabase;
import model.LibraryStaff.ReturnBill599;
import java.sql.*;
import java.time.LocalDateTime;
import java.util.ArrayList;
import java.util.List;

public class ReturnBillDao599 {
    public int createBill (ReturnBill599 returnBill599) throws SQLException {
        LocalDateTime currentDate = LocalDateTime.now();
        Timestamp timestamp = Timestamp.valueOf(currentDate);

        String sql = "INSERT INTO tbl_return_bill599 (regis_date, total_amount, process_staff) " +
                "VALUES (?, ?, ?)";
        ConnectDatabase.connect();
        try (PreparedStatement statement = ConnectDatabase.jdbcConnection.prepareStatement(sql, Statement.RETURN_GENERATED_KEYS)) {
            statement.setTimestamp(1, timestamp);
            statement.setInt(2, returnBill599.getTotal_amount());
            statement.setString(3, returnBill599.getProcess_staff());

            int affectedRows = statement.executeUpdate();

            if (affectedRows == 0) {
                throw new SQLException("Creating bill failed, no rows affected.");
            }

            try (ResultSet generatedKeys = statement.getGeneratedKeys()) {
                if (generatedKeys.next()) {
                    return generatedKeys.getInt(1); // Lấy id của hóa đơn mới tạo
                } else {
                    throw new SQLException("Creating bill failed, no ID obtained.");
                }
            }
        } finally {
            ConnectDatabase.disconnect();
        }

    }

    public static ReturnBill599 getBillById(int billId) throws SQLException {
        ReturnBill599 returnBill599 = new ReturnBill599();
        String sql = "SELECT * FROM tbl_return_bill599 WHERE id = ?";

        ConnectDatabase.connect();

        try (PreparedStatement statement = ConnectDatabase.jdbcConnection.prepareStatement(sql)) {
            statement.setInt(1, billId);

            try (ResultSet resultSet = statement.executeQuery()) {
                if (resultSet.next()) {
                    returnBill599.setId(resultSet.getInt("id"));
                    returnBill599.setRegis_date(resultSet.getTimestamp("regis_date").toLocalDateTime());
                    returnBill599.setTotal_amount(resultSet.getInt("total_amount"));
                    returnBill599.setProcess_staff(resultSet.getString("process_staff"));
                }
            }
        } finally {
            ConnectDatabase.disconnect();
        }

        return returnBill599;
    }
    public List<ReturnBill599> getAllBill() throws SQLException {
        List<ReturnBill599> list = new ArrayList<>();
        String sql = "SELECT * FROM tbl_return_bill599";
        ConnectDatabase.connect();
        PreparedStatement statement = ConnectDatabase.jdbcConnection.prepareStatement(sql);
        ResultSet resultSet = statement.executeQuery();

        while (resultSet.next()) {
            ReturnBill599 returnBill599 = new ReturnBill599();
            returnBill599.setId(resultSet.getInt("id"));
            returnBill599.setTotal_amount(resultSet.getInt("total_amount"));
            returnBill599.setProcess_staff(resultSet.getString("process_staff"));
            returnBill599.setRegis_date(resultSet.getTimestamp("regis_date").toLocalDateTime());
            list.add(returnBill599);

        }
        ConnectDatabase.disconnect();
        return list;
    }
}
