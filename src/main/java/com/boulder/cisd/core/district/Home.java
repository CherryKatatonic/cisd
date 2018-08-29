package com.boulder.cisd.core.district;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet(name = "Home", urlPatterns = {"/", ""}, loadOnStartup = 1)
public class Home extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        req.setAttribute("campus", "district");
        req.setAttribute("page", "home");
        req.getRequestDispatcher("index.jsp").forward(req, resp);
    }
}
