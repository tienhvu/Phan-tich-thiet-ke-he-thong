package dao.LibraryStaff;

import dao.ConnectDatabase;
import model.LibraryStaff.Document599;
import model.LibraryStaff.ReturnDetails599;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class ReturnDetailsDao599 {
    public List<ReturnDetails599> getBorrowedDocumentsByCardId(int cardId) throws SQLException {
        List<ReturnDetails599> lists = new ArrayList<>();
        String sql ="select a.* , b.title, b.category from tbl_return_details599 a\n" +
                " Join tbl_documents599 b\n" +
                " on a.document_id = b.id\n" +
                " Join tbl_borrow_return599 c on c.id = a.borrow_return_id\n" +
                " where reader_card_id = ?";
        ConnectDatabase.connect();

        PreparedStatement statement = ConnectDatabase.jdbcConnection.prepareStatement(sql);
        statement.setInt(1, cardId);
        ResultSet resultSet = statement.executeQuery();
        while (resultSet.next()){
            ReturnDetails599 returnDetails599 = new ReturnDetails599();
            returnDetails599.setId(resultSet.getInt("id"));
            returnDetails599.setBorrow_return_id(resultSet.getInt("borrow_return_id"));
            returnDetails599.setDocument599(getDocumentInfoById(resultSet.getInt("document_id")));
            returnDetails599.setReturn_date(resultSet.getDate("return_date"));
            returnDetails599.setBorrow_date(resultSet.getDate("borrow_date"));
            returnDetails599.setActual_return_date(resultSet.getDate("actual_return_date"));
            returnDetails599.setQuantity_borrowed(resultSet.getInt("quantity_borrowed"));
            returnDetails599.setFine_amount(resultSet.getInt("fine_amount"));
            returnDetails599.setFine_reason(resultSet.getString("fine_reason"));
            returnDetails599.setStatus(resultSet.getInt("status"));

            lists.add(returnDetails599);
        }
        ConnectDatabase.disconnect();
        return lists;

    }
    public Document599 getDocumentInfoById (int documentId) throws SQLException {
        String sql ="select * from tbl_documents599 where id = ?";
        ConnectDatabase.connect();

        PreparedStatement statement = ConnectDatabase.jdbcConnection.prepareStatement(sql);
        statement.setInt(1, documentId);
        ResultSet resultSet = statement.executeQuery();

        if(resultSet.next()){
            Document599 document599 = new Document599();
            document599.setId(documentId);
            document599.setTitle(resultSet.getString("title"));
            document599.setCategory(resultSet.getString("category"));
            document599.setDescription(resultSet.getString("description"));
            return document599;
        }
        return null;
    }

    public void updateReturnDetails(ReturnDetails599 returnDetails599) throws SQLException {
        String sql = "UPDATE tbl_return_details599 SET status=?, actual_return_date=?, fine_amount=?, fine_reason=?, bill_id=? WHERE borrow_return_id=? AND document_id=?";
        ConnectDatabase.connect();

        try (PreparedStatement statement = ConnectDatabase.jdbcConnection.prepareStatement(sql)) {
            statement.setInt(1, 1);
            statement.setDate(2, returnDetails599.getActual_return_date());
            statement.setInt(3, returnDetails599.getFine_amount());
            statement.setString(4, returnDetails599.getFine_reason());
            statement.setInt(5, returnDetails599.getReturnBill599().getId());
            statement.setInt(6, returnDetails599.getBorrow_return_id());
            statement.setInt(7, returnDetails599.getDocument599().getId());
            statement.executeUpdate();
        } finally {
            ConnectDatabase.disconnect();
        }
    }

    public ReturnDetails599 getInForById(int return_details_id) throws SQLException {
        String sql = "select * from tbl_return_details599 where id=?";
        ConnectDatabase.connect();

        PreparedStatement statement = ConnectDatabase.jdbcConnection.prepareStatement(sql);
        statement.setInt(1, return_details_id);
        ResultSet resultSet = statement.executeQuery();

        if (resultSet.next()) {
            ReturnDetails599 returnDetails599 = new ReturnDetails599();
            returnDetails599.setId(return_details_id);
            returnDetails599.setBorrow_return_id(resultSet.getInt("borrow_return_id"));
            returnDetails599.setDocument599(getDocumentInfoById(resultSet.getInt("document_id")));
            returnDetails599.setBorrow_date(resultSet.getDate("borrow_date"));
            returnDetails599.setReturn_date(resultSet.getDate("return_date"));
            returnDetails599.setActual_return_date(resultSet.getDate("actual_return_date"));
            returnDetails599.setFine_amount(resultSet.getInt("fine_amount"));
            returnDetails599.setFine_reason(resultSet.getString("fine_reason"));
            returnDetails599.setQuantity_borrowed(resultSet.getInt("quantity_borrowed"));
            return returnDetails599;
        }
        ConnectDatabase.disconnect();
        return null;
    }

    public ReturnDetails599 getReturnDetailById(int id) throws SQLException {
        String sql ="Select * from tbl_return_details599 where id=?";
        ConnectDatabase.connect();
        PreparedStatement statement = ConnectDatabase.jdbcConnection.prepareStatement(sql);
        ResultSet resultSet = statement.executeQuery();
        while (resultSet.next()) {
            ReturnDetails599 returnDetails599 = new ReturnDetails599();
            returnDetails599.setId(resultSet.getInt("id"));
            return returnDetails599;
        }
        ConnectDatabase.disconnect();
        return null;
    }

    public List<ReturnDetails599> getReturnDetailsByBillId(int billId) throws SQLException {
        List<ReturnDetails599> returnDetailsList = new ArrayList<>();
        String sql = "SELECT * FROM tbl_return_details599 WHERE bill_id = ?";

        ConnectDatabase.connect();

        try (PreparedStatement statement = ConnectDatabase.jdbcConnection.prepareStatement(sql)) {
            statement.setInt(1, billId);

            try (ResultSet resultSet = statement.executeQuery()) {
                while (resultSet.next()) {
                    ReturnDetails599 returnDetails599 = new ReturnDetails599();
                    returnDetails599.setId(resultSet.getInt("id"));
                    returnDetails599.setBorrow_return_id(resultSet.getInt("borrow_return_id"));
                    returnDetails599.setActual_return_date(resultSet.getDate("actual_return_date"));
                    returnDetails599.setFine_amount(resultSet.getInt("fine_amount"));
                    returnDetails599.setFine_reason(resultSet.getString("fine_reason"));
                    // Bạn có thể thiết lập thêm các thông tin khác nếu cần

                    returnDetailsList.add(returnDetails599);
                }
            }
        } finally {
            ConnectDatabase.disconnect();
        }

        return returnDetailsList;
    }
}
