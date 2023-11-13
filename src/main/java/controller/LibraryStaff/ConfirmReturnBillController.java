package controller.LibraryStaff;

import dao.LibraryStaff.ReturnBillDao599;
import dao.LibraryStaff.ReturnDetailsDao599;
import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import model.LibraryStaff.ReturnBill599;
import model.LibraryStaff.ReturnDetails599;
import model.Member599;

import java.io.IOException;
import java.sql.SQLException;
import java.time.LocalDateTime;
import java.util.List;

import static dao.LibraryStaff.ReturnBillDao599.getBillById;

@WebServlet(urlPatterns = {"/confirm-bill"})
public class ConfirmReturnBillController extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        HttpSession session = req.getSession();
        List<ReturnDetails599> list = (List<ReturnDetails599>) session.getAttribute("returnDetailsList");
        int totalAmount = (int) session.getAttribute("totalAmount");
        LocalDateTime regis_date = (LocalDateTime) session.getAttribute("regis_date");
        Member599 admin = (Member599) session.getAttribute("admin");

        // Hiển thị thông tin hóa đơn trên trang
        req.setAttribute("totalAmount",totalAmount);
        req.setAttribute("regis_date",regis_date);
        req.setAttribute("returnDetailList", list);


        RequestDispatcher dispatcher = req.getRequestDispatcher("/views/admin/confirmBill.jsp");
        dispatcher.forward(req, resp);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        HttpSession session = req.getSession();
        int totalAmount = (int) session.getAttribute("totalAmount");
        LocalDateTime regisDate = (LocalDateTime) session.getAttribute("regis_date");
        Member599 admin = (Member599) session.getAttribute("admin");
        ReturnDetailsDao599 returnDetailsDao599 = new ReturnDetailsDao599();
        ReturnBillDao599 returnBillDao599 = new ReturnBillDao599();

        try {
            // Tạo hóa đơn mới
            ReturnBill599 confirmBill599 = new ReturnBill599();
            confirmBill599.setProcess_staff(admin.getName());
            confirmBill599.setTotal_amount(totalAmount);
            confirmBill599.setRegis_date(regisDate);


            int billId = returnBillDao599.createBill(confirmBill599);
            // Lưu thông tin vào return_details và thiết lập bill_id
            List<ReturnDetails599> list = (List<ReturnDetails599>) session.getAttribute("returnDetailsList");
            for (ReturnDetails599 returnDetails599 : list) {
                returnDetails599.setReturnBill599(getBillById(billId));
                returnDetailsDao599.updateReturnDetails(returnDetails599);
                confirmBill599.setId(returnDetails599.getReturnBill599().getId());
            }

            // Lưu hóa đơn vào session
            session.setAttribute("confirmBill599", confirmBill599);
            session.setAttribute("success", "Tạo hóa đơn thành công");
            resp.sendRedirect("print-bill");
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
    }
}
