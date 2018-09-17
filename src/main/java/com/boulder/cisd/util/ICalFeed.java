package com.boulder.cisd.util;

import biweekly.Biweekly;
import biweekly.ICalendar;
import com.boulder.cisd.daos.CalendarDao;
import com.boulder.cisd.objects.Calendar;
import com.google.gson.Gson;

import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;

@WebServlet("/ical-feed")
public class ICalFeed extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws IOException {
        CalendarDao dao = (CalendarDao) getServletContext().getAttribute("calDao");
        String id = req.getParameter("id");
        Calendar cal = dao.getCalendar(id);
        if (cal == null) { System.out.println("Calendar not found"); }
        String icalUrl = cal.getIcsUrl();
        ICalendar ical = Biweekly.parse(new File(icalUrl)).first();
        resp.setContentType("application/json");
        resp.setCharacterEncoding("UTF-8");
        PrintWriter out = resp.getWriter();
        out.write(new Gson().toJson(ical.getEvents()));
        out.close();
    }
}
