package controller.Reader;

import dao.MemberDao599;
import dao.Reader.ReaderCardDao599;
import dao.Reader.ReaderDao599;
import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import model.Member599;
import model.Reader.Reader599;
import model.Reader.ReaderCard599;

import java.io.IOException;
import java.sql.SQLException;


@WebServlet(urlPatterns = {"/readerCard"})
public class ReaderRegisterCardController extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

        ReaderDao599 readerDao599 = new ReaderDao599();
        Member599 member = (Member599) req.getSession().getAttribute("member");
        ReaderCardDao599 readerCardDao599 = new ReaderCardDao599();
        int readerId = 0;
        try {
            readerId = readerDao599.getReaderId(member.getId());
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
        try {
            if (readerCardDao599.isRegisteredCard(readerId)) {
                ReaderCard599 readerCard = readerCardDao599.getReaderCardInfo(readerId);
                req.getSession().setAttribute("readerCard", readerCard);
                resp.sendRedirect("readerCard-detail");

            } else {
                RequestDispatcher rd = req.getRequestDispatcher("/views/reader/registerCard.jsp");
                rd.forward(req, resp);
            }
        } catch (SQLException ex) {
            throw new RuntimeException(ex);
        }
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String studentCode = req.getParameter("studentCode");
        String studentClass = req.getParameter("student_class");
        String gender = req.getParameter("gender");
        String username = (String) req.getSession().getAttribute("username");
        boolean registrationResult = false;
        try {
            MemberDao599 memberDao599 = new MemberDao599();
            ReaderDao599 readerDao599 = new ReaderDao599();
            int memberId = memberDao599.getMemberIdByUsername(username);
            ReaderCard599 readerCard = new ReaderCard599();
            readerCard.setReader_id(readerDao599.getReaderId(memberId));
            readerCard.setStudent_code(studentCode);
            readerCard.setStudent_class(studentClass);
            readerCard.setGender(gender);
            ReaderCardDao599 readerCardDao599 = new ReaderCardDao599();
            registrationResult = readerCardDao599.saveReaderCard(readerCard);
            if (registrationResult) {
                Member599 member = (Member599) req.getSession().getAttribute("member");
                int readerId = readerDao599.getReaderId(member.getId());
                readerCard = readerCardDao599.getReaderCardInfo(readerId);
                req.getSession().setAttribute("readerCard", readerCard);
                req.getSession().setAttribute("success", "Đăng ký thành công" );
                resp.sendRedirect("reader-home");
            } else {
                req.setAttribute("errorRegis", "Mã sinh viên đã tồn tại");
                RequestDispatcher rd = req.getRequestDispatcher("/views/reader/registerCard.jsp");
                rd.forward(req, resp);
            }
        } catch (SQLException e) {
            req.setAttribute("errorRegis", "Lỗi trong cơ sở dữ liệu");
            RequestDispatcher rd = req.getRequestDispatcher("/views/reader/registerCard.jsp");
            rd.forward(req, resp);
        }
    }
}
