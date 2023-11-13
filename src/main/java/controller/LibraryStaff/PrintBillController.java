package controller.LibraryStaff;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import model.LibraryStaff.ReturnBill599;


import java.io.IOException;

@WebServlet(urlPatterns = {"/print-bill"})
public class PrintBillController extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        HttpSession session = req.getSession();
        ReturnBill599 confirmBill599 =(ReturnBill599)  session.getAttribute("confirmBill599");
        session.setAttribute("confirmBill599", confirmBill599);
        RequestDispatcher dispatcher = req.getRequestDispatcher("/views/admin/printBill.jsp");
        dispatcher.forward(req, resp);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        req.getSession().setAttribute("success","Xử lí trả tài liệu thành công");
        resp.sendRedirect("admin-home");
    }
}
