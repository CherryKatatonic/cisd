package com.boulder.cisd.auth;

import com.boulder.cisd.daos.UserDao;
import com.boulder.cisd.objects.User;
import com.boulder.cisd.util.EmailService;

import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;

@MultipartConfig
@WebServlet("/signup")
public class Signup extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        doPost(req, resp);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        UserDao dao = (UserDao) this.getServletContext().getAttribute("userDao");
        String email = req.getParameter("email");
        HttpSession ses = req.getSession();
        String referrer = req.getHeader("referer");
        String adminPass = dao.getAdminPass();

        if (dao.getUser(email) != null) {
            ses.setAttribute("signupEmail", email);
            ses.setAttribute("signupError", "An account with that email already exists");
            ses.setAttribute("script", "$('#loginDropdown').click(); $('#signupTab').click();");
            resp.sendRedirect(referrer);
            return;
        }

        try {
            if (!PasswordStorage.verifyPassword(req.getParameter("password"), adminPass)) {
                ses.setAttribute("signupEmail", email);
                ses.setAttribute("signupError", "Invalid password");
                ses.setAttribute("script", "$('#loginDropdown').click(); $('#signupTab').click();");
                resp.sendRedirect(referrer);
                return;
            }
        } catch (PasswordStorage.CannotPerformOperationException | PasswordStorage.InvalidHashException e) {
            e.printStackTrace();
        }

        User user = dao.createUser(new User.Builder()
                    .email(email)
                    .password(adminPass)
                    .emailVerified(false)
                    .build());

            EmailService.emailVerificationRequest(req, user);

            ses.setAttribute("signupMessage", "An activation link has been sent to your email. Please " +
                    "click the link to confirm your email and activate your account.");
            ses.setAttribute("script", "$('#loginDropdown').click(); $('#signupTab').click();");
            resp.sendRedirect(referrer);

    }
}
