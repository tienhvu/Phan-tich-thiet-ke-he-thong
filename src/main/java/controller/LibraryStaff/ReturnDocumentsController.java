package controller.LibraryStaff;

import dao.LibraryStaff.ReturnDetailsDao599;
import dao.Reader.ReaderCardDao599;
import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import model.LibraryStaff.ReturnDetails599;
import model.Member599;
import java.io.IOException;
import java.sql.SQLException;

import java.util.List;

@WebServlet(urlPatterns = {"/return-documents"})
public class ReturnDocumentsController extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        RequestDispatcher rd = req.getRequestDispatcher("/views/admin/return-documents.jsp");
        rd.forward(req, resp);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        int cardId = Integer.parseInt(req.getParameter("cardId"));
        ReturnDetailsDao599 returnDetailsDao599 = new ReturnDetailsDao599();
        ReaderCardDao599 readerCardDao599 = new ReaderCardDao599();

        try {
            List<ReturnDetails599> lists = returnDetailsDao599.getBorrowedDocumentsByCardId(cardId);

            Member599 member599 = readerCardDao599.getMemberByReaderCardId(cardId);

            HttpSession session = req.getSession();
            session.setAttribute("member599", member599);
            session.setAttribute("lists", lists);
            session.setAttribute("cardId", cardId);
            resp.sendRedirect("return-documents?cardId=" + cardId);

        } catch (SQLException e) {
            e.printStackTrace();
            throw new RuntimeException(e);
        }
    }
}
