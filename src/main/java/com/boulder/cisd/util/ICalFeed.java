package com.boulder.cisd.util;

import biweekly.Biweekly;
import biweekly.ICalendar;
import biweekly.component.VEvent;
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
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.*;

@WebServlet("/ical-feed")
public class ICalFeed extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws IOException {
        CalendarDao dao = (CalendarDao) getServletContext().getAttribute("calDao");
        String id = req.getParameter("id");
        Calendar cal = dao.getCalendar(id);
        if (cal == null) { System.out.println("Calendar not found"); }
        File file = new File(cal.getIcsUrl());
        new File(System.getenv("CATALINA_BASE") + "/storage/calendars").mkdirs();

        if (file.createNewFile()) {
            cal.setIcsUrl(file.getPath());
            ICalendar ical = new ICalendar();
            ical.setName(id);
            ical.setDescription(id + "calendar");
            ical.setUrl("localhost:8080/" + id + "/calendar");
            ical.write(file);
        }

        resp.setContentType("application/json");
        resp.setCharacterEncoding("UTF-8");
        PrintWriter out = resp.getWriter();

        TimeZone tz = TimeZone.getTimeZone("America/Chicago");
        DateFormat df = new SimpleDateFormat("yyyy-MM-dd"); // Quoted "Z" to indicate UTC, no timezone offset
        df.setTimeZone(tz);
        List<Map> events = new ArrayList<>();
        ICalendar ical = Biweekly.parse(file).first();

        for (VEvent event : ical.getEvents()) {
            Map<String, Object> map = new HashMap<>();
            map.put("id", event.getUid().getValue());
            map.put("start", df.format(event.getDateStart().getValue()));
            map.put("title", event.getSummary().getValue());
            events.add(map);
        }

        out.print(new Gson().toJson(events));
        out.flush();
        out.close();
    }
}
