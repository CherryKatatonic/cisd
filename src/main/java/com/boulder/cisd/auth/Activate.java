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

@WebServlet("/activate")
public class Activate extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        UserDao dao = (UserDao) getServletContext().getAttribute("userDao");
        User user = dao.getUser(Long.parseLong(req.getParameter("uid")));

        if (user == null) {
            req.setAttribute("error", "User not found. " +
                    "Please try again or contact your administrator.");
            req.setAttribute("page", "activate");
            req.getRequestDispatcher("/index.jsp").forward(req, resp);
            return;
        }

        user.setEmailVerified(true);
        HttpSession ses = req.getSession(true);
        ses.setAttribute("user", user);
        ses.setMaxInactiveInterval(60*60);
        resp.sendRedirect("/set-password");
    }
}
