package com.boulder.cisd.core.district;

import com.boulder.cisd.daos.CalendarDao;
import com.boulder.cisd.util.iCalTest;

import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@MultipartConfig
@WebServlet("/calendar")
public class Calendar extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        req.setAttribute("campus", "district");
        req.setAttribute("page", "calendar");
        req.getRequestDispatcher("/index.jsp").forward(req, resp);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        CalendarDao dao = (CalendarDao) getServletContext().getAttribute("calDao");
        System.out.println(req.getParameter("id"));
        com.boulder.cisd.objects.Calendar cal = dao.getCalendar(req.getParameter("id"));
        iCalTest.addEvent(cal);
        resp.sendRedirect("/calendar");
    }
}
