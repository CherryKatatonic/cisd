package com.boulder.cisd.core.district;

import biweekly.ICalendar;
import com.boulder.cisd.daos.CalendarDao;
import com.boulder.cisd.util.CalendarHelper;

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
        CalendarDao dao = (CalendarDao) getServletContext().getAttribute("calDao");

        if (dao.getCalendar("district") == null) {
            ICalendar ical = CalendarHelper.createCalendar("district");
            com.boulder.cisd.objects.Calendar cal = null;

            try {
                cal = new com.boulder.cisd.objects.Calendar("district", ical);
            } catch (IOException e1) {
                e1.printStackTrace();
            }

            dao.saveCalendar(cal);
        }

        req.setAttribute("campus", "district");
        req.setAttribute("page", "calendar");
        req.getRequestDispatcher("/index.jsp").forward(req, resp);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        CalendarDao dao = (CalendarDao) getServletContext().getAttribute("calDao");
        com.boulder.cisd.objects.Calendar cal = dao.getCalendar(req.getParameter("id"));
        // TODO - create calendar or event
        resp.sendRedirect("/calendar");
    }
}
