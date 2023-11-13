package controller.Authentication;

import dao.MemberDao599;
import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;


@WebServlet(urlPatterns = {"/login","/logout"})
public class Login_LogoutController extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String uri = req.getRequestURI();

        if(uri.equals("logout")) {
            handleLogout(req, resp);
        }else {

            req.getSession().removeAttribute("errorRegis");
            RequestDispatcher rd = req.getRequestDispatcher("/views/login.jsp");
            rd.forward(req, resp);
            req.getSession().removeAttribute("error");
            req.getSession().removeAttribute("success");
        }
    }
    private void handleLogout(HttpServletRequest request, HttpServletResponse response) throws IOException {

        request.getSession().invalidate();
        response.sendRedirect("login");

    }
    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String username = req.getParameter("username");
        String password = req.getParameter("password");

        MemberDao599 memberDao = new MemberDao599();
        String role = memberDao.getUserRole(username,password);

        if(role != null){

            if(role.equals("admin")){
                HttpSession session = req.getSession();
                session.setAttribute("username", username);
                resp.sendRedirect("admin-home");
            }
            else if(role.equals("user")) {
                HttpSession session = req.getSession();
                session.setAttribute("username", username);
                resp.sendRedirect("reader-home");
            }

        } else {
            // Sai tk hoặc mk
            req.getSession().setAttribute("error", "Tên đăng nhập hoặc mật khẩu không chính xác.");
            req.getSession().removeAttribute("success");
            resp.sendRedirect("login");
        }
    }


}
