package com.boulder.cisd.auth;

import com.boulder.cisd.daos.UserDao;
import com.boulder.cisd.objects.User;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;

@WebServlet("/login")
public class Login extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        super.doGet(req, resp);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        UserDao dao = (UserDao) this.getServletContext().getAttribute("userDao");
        HttpSession ses = req.getSession();
        String referrer = req.getHeader("referer");
        String email = req.getParameter("email");
        User user = dao.getUser(email);

        if (user == null) {
            ses.setAttribute("loginEmail", email);
            ses.setAttribute("loginError", "User account not found");
            ses.setAttribute("script", "$('#loginDropdown').click(); $('#loginTab').click();");
            resp.sendRedirect(referrer);
            return;
        }

        try {
            if (!PasswordStorage.verifyPassword(req.getParameter("password"), user.getPassword())) {
                ses.setAttribute("loginEmail", email);
                ses.setAttribute("loginError", "Invalid password");
                ses.setAttribute("script", "$('#loginDropdown').click(); $('#loginTab').click();");
                resp.sendRedirect(referrer);
                return;
            }
        } catch (PasswordStorage.CannotPerformOperationException | PasswordStorage.InvalidHashException e) {
            e.printStackTrace();
        }

        ses.setMaxInactiveInterval(60*60);
        ses.setAttribute("user", user);
        resp.sendRedirect(req.getParameter(referrer));
    }
}
