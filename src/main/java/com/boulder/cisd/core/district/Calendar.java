package com.boulder.cisd.core.district;

import biweekly.ICalendar;
import biweekly.component.VEvent;
import com.boulder.cisd.daos.CalendarDao;
import com.boulder.cisd.util.CalendarHelper;
import com.boulder.cisd.util.CloudStorageHelper;

import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.text.ParseException;

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
                cal = new com.boulder.cisd.objects.Calendar("district", ical, getServletContext().getContextPath());
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
        CloudStorageHelper storage = (CloudStorageHelper) getServletContext().getAttribute("storage");
        CalendarDao dao = (CalendarDao) getServletContext().getAttribute("calDao");
        String[] cals = req.getParameterValues("calendar");
        VEvent e = null;

        try {
            e = CalendarHelper.createEvent(req);
        } catch (ParseException e1) {
            e1.printStackTrace();
        }

        for (String id : cals) {
            com.boulder.cisd.objects.Calendar cal = dao.getCalendar(id);
            ICalendar ical = storage.downloadCalendar(id, cal.getBlobName());
            ical.addEvent(e);
            storage.saveCalendar(id, ical, getServletContext().getContextPath());
            dao.saveCalendar(cal);
        }

        resp.sendRedirect("/calendar");
    }
}
