package servlet;

import manager.UserManager;
import model.User;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;
import java.io.IOException;

@WebServlet(urlPatterns = "/registration")
public class RegistrationServlet extends HttpServlet {
    UserManager userManager = new UserManager();

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        req.getRequestDispatcher("/WEB-INF/registration.jsp").forward(req, resp);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String email = req.getParameter("useremail");
        if (userManager.getUserByEmail(email) != null) {
            req.setAttribute("msg", "User already exist");
            req.getRequestDispatcher("/WEB-INF/registration.jsp").forward(req, resp);
        } else {

            String username = req.getParameter("username");
            String usersurname = req.getParameter("username");
            String useremail = req.getParameter("useremail");
            String userpassword = req.getParameter("userpassword");

            User user = User.builder()
                    .username(username)
                    .usersurname(usersurname)
                    .useremail(useremail)
                    .userpassword(userpassword)
                    .build();
            userManager.add(user);
            resp.sendRedirect("homePage");
        }
    }
}