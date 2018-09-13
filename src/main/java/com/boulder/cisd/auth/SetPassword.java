package com.boulder.cisd.auth;

import com.boulder.cisd.objects.User;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;

@WebServlet("/set-password")
public class SetPassword extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        HttpSession ses = req.getSession();
        User user = (User) ses.getAttribute("user");

        if (user == null) {
            req.setAttribute("error", "Something went wrong. " +
                    "Please try signing in again or contact your administrator.");
            req.setAttribute("page", "set-password");
            req.getRequestDispatcher("/index.jsp").forward(req, resp);
            return;
        }

        req.setAttribute("page", "set-password");
        req.getRequestDispatcher("/index.jsp").forward(req, resp);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        HttpSession ses = req.getSession();
        User user = (User) ses.getAttribute("user");

        if (user == null || req.getParameter("password") == null) {
            req.setAttribute("error", "Something went wrong. " +
                    "Please try signing in again or contact your administrator.");
            req.setAttribute("page", "set-password");
            req.getRequestDispatcher("/index.jsp").forward(req, resp);
            return;
        }

        try {
            user = user.setPassword(PasswordStorage.createHash(req.getParameter("password")));
        } catch (PasswordStorage.CannotPerformOperationException e) {
            e.printStackTrace();
        }

        ses.setAttribute("user", user);
        resp.sendRedirect("/");
    }
}
