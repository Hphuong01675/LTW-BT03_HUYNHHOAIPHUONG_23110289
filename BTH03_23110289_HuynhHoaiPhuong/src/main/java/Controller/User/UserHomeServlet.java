package Controller.User;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;
import Models.User;
import Models.Category;
import Service.Impl.CategoryServiceImpl;

import java.io.IOException;
import java.util.List;

@WebServlet("/user/home")
public class UserHomeServlet extends HttpServlet {
    private final CategoryServiceImpl cs = new CategoryServiceImpl();

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp)
            throws ServletException, IOException {

        HttpSession session = req.getSession(false);
        if (session == null || session.getAttribute("account") == null) {
            resp.sendRedirect(req.getContextPath() + "/user/login");
            return;
        }

        // Lấy user từ session
        User u = (User) session.getAttribute("account");

        // Lấy category theo roleid và userid từ Service (đã dùng JPA)
        List<Category> categories = cs.getCategoriesForHome(u.getRoleid(), u.getId());

        req.setAttribute("categories", categories);
        req.setAttribute("currentUser", u); // để JSP hiển thị fullname
        req.getRequestDispatcher("/Views/user/home.jsp").forward(req, resp);
    }
}
