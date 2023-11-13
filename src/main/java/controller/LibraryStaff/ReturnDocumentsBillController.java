package controller.LibraryStaff;

import dao.LibraryStaff.ReturnDetailsDao599;
import dao.MemberDao599;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import model.LibraryStaff.ReturnDetails599;
import model.Member599;

import java.io.IOException;
import java.sql.Date;
import java.sql.SQLException;
import java.time.LocalDate;
import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;
import java.util.ArrayList;
import java.util.List;


@WebServlet(urlPatterns = {"/return-document-bills"})
public class ReturnDocumentsBillController extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String[] selected = req.getParameterValues("selected");
        if (selected != null && selected.length > 0) {
            List<ReturnDetails599> returnDetailsList = new ArrayList<>();
            int totalAmount=0;
            for (String returnDetailId : selected) {
                int return_detail_id = Integer.parseInt(returnDetailId);
                ReturnDetailsDao599 returnDetailsDao599 = new ReturnDetailsDao599();
                try {
                    ReturnDetails599 returnDetails599 = returnDetailsDao599.getInForById(return_detail_id);
                    LocalDate actualReturnDate = LocalDate.parse(req.getParameter("actualReturnDate_" + return_detail_id));
                    int fineAmount = Integer.parseInt(req.getParameter("fineAmount_" + return_detail_id));
                    String fineReason = req.getParameter("fineReason_" + return_detail_id);


                    returnDetails599.setActual_return_date(Date.valueOf(actualReturnDate));
                    returnDetails599.setFine_amount(fineAmount);
                    returnDetails599.setFine_reason(fineReason);

                    returnDetailsList.add(returnDetails599);
                    totalAmount += fineAmount;

                    LocalDateTime currentTime = LocalDateTime.now();
                    // Định dạng ngày giờ theo chuẩn MySQL
                    DateTimeFormatter formatter = DateTimeFormatter.ofPattern("yyyy-MM-dd HH:mm:ss");
                    String formattedDateTime = currentTime.format(formatter);
                    LocalDateTime time = LocalDateTime.parse(formattedDateTime, formatter);

                    HttpSession session = req.getSession();
                    session.setAttribute("regis_date", time);
                    session.setAttribute("totalAmount", totalAmount);
                    session.setAttribute("returnDetailsList", returnDetailsList);

                    MemberDao599 memberDao599 = new MemberDao599();
                    String username = (String) session.getAttribute("username");
                    Member599 admin = (Member599) memberDao599.getMemberInfoByUsername(username);
                    session.setAttribute("admin",admin);
                } catch (SQLException e) {
                    throw new RuntimeException(e);
                }
            }
            resp.sendRedirect("confirm-bill");
        }
    }

}
