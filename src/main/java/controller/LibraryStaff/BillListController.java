package controller.LibraryStaff;

import dao.LibraryStaff.ReturnBillDao599;
import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import model.LibraryStaff.ReturnBill599;

import java.io.IOException;
import java.sql.SQLException;
import java.util.List;

@WebServlet(urlPatterns = {"/bill-list"})
public class BillListController extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        HttpSession session = req.getSession();
        ReturnBillDao599 returnBillDao599 = new ReturnBillDao599();
        try {
            List<ReturnBill599> listBills = returnBillDao599.getAllBill();
            session.setAttribute("listBills", listBills);
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
        RequestDispatcher dispatcher = req.getRequestDispatcher("/views/admin/billList.jsp");
        dispatcher.forward(req, resp);
    }
}
