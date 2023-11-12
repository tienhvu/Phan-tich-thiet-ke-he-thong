package dao.Reader;

import dao.ConnectDatabase;

import model.Member599;
import model.Reader.ReaderCard599;

import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;


public class ReaderCardDao599 {
    public boolean isRegisteredCard(int readerId) throws SQLException {
        String sql = "SELECT reader_id FROM tbl_reader_card599 WHERE reader_id = ?";
        ConnectDatabase.connect();

        PreparedStatement statement = ConnectDatabase.jdbcConnection.prepareStatement(sql);
        statement.setInt(1, readerId);
        try (ResultSet resultSet = statement.executeQuery()) {

            return resultSet.next();
        }finally {
            ConnectDatabase.disconnect();
        }
    }

    public boolean saveReaderCard(ReaderCard599 readerCard) throws SQLException {
        if (!isUniqueField("student_code", readerCard.getStudent_code()) ) {
            return false;
        }
        Date currentDate = new Date(System.currentTimeMillis());
        String sql = "INSERT INTO tbl_reader_card599 (reader_id, student_class, student_code, regis_date, gender) " +
                "VALUES (?, ?, ?, ?, ?)";

        ConnectDatabase.connect();

        PreparedStatement statement = ConnectDatabase.jdbcConnection.prepareStatement(sql);
        statement.setInt(1, readerCard.getReader_id());
        statement.setString(2, readerCard.getStudent_class());
        statement.setString(3, readerCard.getStudent_code());
        statement.setDate(4, currentDate);
        statement.setString(5, readerCard.getGender());

        boolean rowInserted = statement.executeUpdate() > 0;
        statement.close();
        ConnectDatabase.disconnect();
        return rowInserted;
    }

    public boolean isUniqueField(String fieldName, String value) throws SQLException {
        String sql = "SELECT COUNT(*) FROM tbl_reader_card599 WHERE " + fieldName + " = ?";
        ConnectDatabase.connect();

        PreparedStatement statement = ConnectDatabase.jdbcConnection.prepareStatement(sql);
        statement.setString(1, value);

        ResultSet resultSet = statement.executeQuery();
        if (resultSet.next()) {
            int count = resultSet.getInt(1);
            return count == 0;
        }
        ConnectDatabase.disconnect();
        return false;
    }

    public ReaderCard599 getReaderCardInfo(int readerId)throws SQLException {

        String sql = "select * from tbl_reader_card599 where reader_id=?";
        ConnectDatabase.connect();

        PreparedStatement statement = ConnectDatabase.jdbcConnection.prepareStatement(sql);
        statement.setInt(1, readerId);
        ResultSet resultSet = statement.executeQuery();

        if (resultSet.next()) {
            ReaderCard599 readerCard = new ReaderCard599();
            readerCard.setId(resultSet.getInt("id"));
            readerCard.setReader_id(readerId);
            readerCard.setStudent_class(resultSet.getString("student_class"));
            readerCard.setStudent_code(resultSet.getString("student_code"));
            readerCard.setGender(resultSet.getString("gender"));
            readerCard.setRegis_date(resultSet.getDate("regis_date"));
            return readerCard;
        }
        ConnectDatabase.disconnect();
        return null;
    }
    public Member599 getMemberByReaderCardId(int cardId) throws SQLException {
        String sql = "SELECT m.id, m.name FROM tbl_reader_card599 rc\n" +
                "JOIN tbl_reader599 r ON rc.reader_id = r.id \n" +
                "JOIN tbl_member599 m ON r.member_id = m.id\n" +
                "WHERE rc.id = ?";
        ConnectDatabase.connect();

        PreparedStatement statement = ConnectDatabase.jdbcConnection.prepareStatement(sql);
        statement.setInt(1, cardId);
        ResultSet resultSet = statement.executeQuery();
        if(resultSet.next()){
            Member599 member599 = new Member599();
            member599.setId(resultSet.getInt("id"));
            member599.setName(resultSet.getString("name"));
            return member599;
        }
        ConnectDatabase.disconnect();
        return null;

    }
}
