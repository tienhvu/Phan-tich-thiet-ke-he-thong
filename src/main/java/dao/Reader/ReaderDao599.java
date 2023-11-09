package dao.Reader;

import dao.ConnectDatabase;
import model.Member599;
import java.sql.*;


public class ReaderDao599 {

    public ReaderDao599() {
    }

    public Member599 getMemberInfo(int memberId) throws SQLException {
        String sql = "SELECT * FROM tbl_member599 a Join tbl_reader599 b on a.id= b.member_id WHERE member_id = ?";
        ConnectDatabase.connect();
        PreparedStatement statement = ConnectDatabase.jdbcConnection.prepareStatement(sql);
        statement.setInt(1, memberId);
        ResultSet resultSet = statement.executeQuery();

        // Xử lý kết quả trả về
        Member599 member = null;
        if (resultSet.next()) {
            String name = resultSet.getString("name");
            Date dateOfBirth = Date.valueOf(resultSet.getString("dob"));
            String email = resultSet.getString("email");
            String address = resultSet.getString("address");
            String phone = resultSet.getString("phone");
            member = new Member599();
            member.setId(memberId);
            member.setName(name);
            member.setDob(dateOfBirth);
            member.setEmail(email);
            member.setAddress(address);
            member.setPhone(phone);
        }
        return member;
    }
    public int getReaderId (int memberId) throws SQLException {
        String sql = "SELECT id from tbl_reader599 where member_id = ?";
        ConnectDatabase.connect();
        PreparedStatement statement = ConnectDatabase.jdbcConnection.prepareStatement(sql);
        statement.setInt(1, memberId);
        ResultSet resultSet = statement.executeQuery();
        if (resultSet.next()) {
            return resultSet.getInt(1);
        }
        else {
            return -1;
        }
    }
}
