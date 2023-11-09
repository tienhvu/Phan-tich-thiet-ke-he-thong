package controller.Authentication;

import dao.MemberDao599;
import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import model.Member599;

import java.io.IOException;
import java.sql.Date;
import java.sql.SQLException;

@WebServlet(urlPatterns = {"/register"})
public class RegisterMemberController extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

        RequestDispatcher rd = req.getRequestDispatcher("/views/register.jsp");
        rd.forward(req, resp);
        req.getSession().removeAttribute("errorRegis");
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        // Nhận thông tin đăng ký từ biểu mẫu
        String username = req.getParameter("username");
        String password = req.getParameter("password");
        String repassword = req.getParameter("repassword");
        String name = req.getParameter("name");
        String email = req.getParameter("email");
        Date dob = Date.valueOf(req.getParameter("dob"));
        String address = req.getParameter("address");
        String phone = req.getParameter("phone");

        if (!password.equals(repassword)) {
            HttpSession session = req.getSession();
            session.setAttribute("errorRegis", "Mật khẩu không trùng khớp.");
            req.getRequestDispatcher("/views/register.jsp").forward(req, resp);
        } else {
            // Dữ liệu hợp lệ, tạo đối tượng Member599 và thực hiện đăng ký
            Member599 member = new Member599(username, password, name,  address, dob,email, phone, "user");
            MemberDao599 memberDao = new MemberDao599();
            boolean registrationSuccess = false;
            try {
                registrationSuccess = memberDao.registerMember(member);
            } catch (SQLException e) {
                throw new RuntimeException(e);
            }

            if (registrationSuccess) {
                HttpSession session = req.getSession();
                session.setAttribute("success", "Đăng ký thành công");
                session.removeAttribute("errorRegis");
                resp.sendRedirect("login");
            } else {
                HttpSession session = req.getSession();
                session.setAttribute("errorRegis", "Dữ liệu nhập vào không hợp lệ.");
                session.removeAttribute("success");
                resp.sendRedirect("register");
            }
        }
    }
}
