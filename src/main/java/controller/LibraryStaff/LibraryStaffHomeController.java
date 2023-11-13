package controller.LibraryStaff;


import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;


import java.io.IOException;
import java.util.Enumeration;

@WebServlet(urlPatterns = {"/admin-home"})
public class LibraryStaffHomeController extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String uri = req.getRequestURI();

        if(uri.endsWith("admin-home")) {
            HttpSession session = req.getSession(false); // Sử dụng getSession(false) để không tạo mới session nếu nó không tồn tại
            if (session != null) {
                Enumeration<String> attributeNames = session.getAttributeNames();
                while (attributeNames.hasMoreElements()) {
                    String attributeName = attributeNames.nextElement();
                    if (!attributeName.equals("username")) {
                        session.removeAttribute(attributeName);
                    }
                }
            }
            RequestDispatcher rd = req.getRequestDispatcher("/views/admin/home.jsp");
            rd.forward(req, resp);
        }
    }
}
