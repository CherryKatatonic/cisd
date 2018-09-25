package com.boulder.cisd.util;

import biweekly.Biweekly;
import biweekly.ICalendar;
import biweekly.component.VEvent;
import com.boulder.cisd.daos.CalendarDao;
import com.boulder.cisd.objects.Calendar;
import com.google.cloud.storage.Blob;
import com.google.cloud.storage.BlobId;
import com.google.cloud.storage.Storage;
import com.google.cloud.storage.StorageOptions;
import com.google.gson.Gson;

import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.*;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.*;

@WebServlet("/ical/*")
public class ICalFeed extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws IOException {
        // GET PATH INFO
        String pathInfo = req.getPathInfo();
        String[] pathParts = pathInfo.split("/");
        String id = pathParts[1];
        String scope = pathParts[2];

        // GET TARGET CALENDAR AND FILE URL
        CalendarDao dao = (CalendarDao) getServletContext().getAttribute("calDao");
        Calendar cal = dao.getCalendar(id);
        if (cal == null) { System.out.println("Calendar not found"); }
        ICalendar ical;

        // GET iCAL OBJECT
        Storage storage = StorageOptions.getDefaultInstance().getService();
        String blobName = cal.getBlobName();
        Blob blob = storage.get(BlobId.of(System.getenv("BUCKET_NAME"), blobName));
        File file = new File(System.getenv("CATALINA_TMPDIR") + "/" + id + ".ics");
        blob.downloadTo(file.toPath());

        // RETURN iCAL FILE IF REQUESTED
        if (scope.equals("calendar")) {
            resp.setContentType("text/calendar");
            resp.setHeader("Content-disposition", "attachment; filename=" + id + ".ics");
            OutputStream out = resp.getOutputStream();
            FileInputStream in = new FileInputStream(file);
            byte[] buffer = new byte[4096];
            int length;
            while ((length = in.read(buffer)) > 0){
                out.write(buffer, 0, length);
            }
            in.close();
            out.flush();
            return;
        }

        // SET UP RESPONSE
        resp.setContentType("application/json");
        resp.setCharacterEncoding("UTF-8");
        PrintWriter out = resp.getWriter();

        // POPULATE MAP OF iCAL EVENTS
        TimeZone tz = TimeZone.getTimeZone("America/Chicago");
        DateFormat df = new SimpleDateFormat("yyyy-MM-dd");
        df.setTimeZone(tz);
        List<Map> events = new ArrayList<>();
        ical = Biweekly.parse(file).first();

        if (!ical.getEvents().isEmpty()) {
            for (VEvent event : ical.getEvents()) {
                Map<String, Object> map = new HashMap<>();
                map.put("id", event.getUid().getValue());
                map.put("start", df.format(event.getDateStart().getValue()));
                map.put("title", event.getSummary().getValue());
                // TODO - map.put(other params)...
                events.add(map);
            }
        }

        // RETURN ARRAY OF iCAL EVENTS
        out.print(new Gson().toJson(events));
        out.flush();
        out.close();
    }
}
