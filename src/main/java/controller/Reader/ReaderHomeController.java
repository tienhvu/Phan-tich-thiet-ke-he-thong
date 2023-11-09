package controller.Reader;

import dao.MemberDao599;
import dao.Reader.ReaderDao599;
import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import jakarta.servlet.http.HttpSession;
import model.Member599;
import model.Reader.ReaderCard599;

import java.io.IOException;
import java.sql.SQLException;


@WebServlet(urlPatterns = {"/reader-home"})
public class ReaderHomeController extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        ReaderDao599 readerDao599 = new ReaderDao599();
        MemberDao599 memberDao599 = new MemberDao599();
        try {
            HttpSession session = req.getSession();
            String username = (String) session.getAttribute("username");
            int memberId = memberDao599.getMemberIdByUsername(username);
            Member599 member = readerDao599.getMemberInfo(memberId);
            session.setAttribute("member", member);
            RequestDispatcher rd = req.getRequestDispatcher("/views/reader/home.jsp");
            rd.forward(req, resp);
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }

    }

}
