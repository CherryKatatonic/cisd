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
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.*;

@WebServlet("/ical/*")
public class ICalFeed extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws IOException {
        // GET PATH INFO:
        String pathInfo = req.getPathInfo();
        String[] pathParts = pathInfo.split("/");
        String id = pathParts[1];
        String scope = pathParts[2];

        // GET TARGET CALENDAR AND FILE URL:
        CalendarDao dao = (CalendarDao) getServletContext().getAttribute("calDao");
        Calendar cal = dao.getCalendar(id);
        if (cal == null) { System.out.println("Calendar not found"); }
        ICalendar ical;

        // DOWNLOAD iCAL FILE:
        Storage storage = StorageOptions.getDefaultInstance().getService();
        String blobName = cal.getBlobName();
        Blob blob = storage.get(BlobId.of(System.getenv("BUCKET_NAME"), blobName));
        File file = new File(System.getenv("CATALINA_TMPDIR") + "/" + id + ".ics");
        blob.downloadTo(file.toPath());

        // DETERMINE APPROPRIATE RESPONSE:

            // Return the entire calendar as a file:
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

            // Return events within a specific date range:
        } else if (scope.equals("range")) {
                // Determine return type:
            boolean export = req.getParameter("_").equals("export");

                // Get iCal object:
            ical = Biweekly.parse(file).first();

                // Configure response (EXPORT/JSON):
            if (export) {
                resp.setContentType("text/calendar");
                resp.setHeader("Content-disposition", "attachment; filename=" + id + ".ics");
            } else {
                resp.setContentType("application/json");
                resp.setCharacterEncoding("UTF-8");
            }
                // Configure date format:
            TimeZone tz = TimeZone.getTimeZone("America/Chicago");
            DateFormat simpleDF = new SimpleDateFormat("yyyy-MM-dd");
            DateFormat isoDF = new SimpleDateFormat("yyyy-MM-dd'T'HH:mm");
            simpleDF.setTimeZone(tz);
            isoDF.setTimeZone(tz);

                // Create events list (EXPORT/JSON):
            List<Map<String, String>> json = null;
            ICalendar tempICal = null;

            if (export) {
                tempICal = CalendarHelper.createCalendar(ical.getNames().get(0).getValue());
            } else {
                json = new ArrayList<>();
            }

                // Iterate through events:
            if (!ical.getEvents().isEmpty()) {
                for (VEvent event : ical.getEvents()) {

                        // Verify date:
                    boolean inRange = false;
                    try {
                        Date rangeStart = simpleDF.parse(req.getParameter("start"));
                        Date rangeEnd = simpleDF.parse(req.getParameter("end"));
                        Date eventStart = simpleDF.parse(simpleDF.format(event.getDateStart().getValue()));
                        Date eventEnd;

                        if (event.getDateEnd() != null) {
                            eventEnd = simpleDF.parse(simpleDF.format(event.getDateEnd().getValue()));
                        } else {
                            eventEnd = eventStart;
                        }

                        boolean startVisible = (eventStart.compareTo(rangeStart) >= 0 && eventEnd.compareTo(rangeEnd) <= 0);
                        boolean endVisible = (eventStart.compareTo(rangeStart) >= 0 && eventEnd.compareTo(rangeEnd) <= 0);

                        if (startVisible || endVisible) {
                            inRange = true;
                        } else {
                            System.out.println("Event " + event.getSummary().getValue() + " not in range.");
                        }
                    } catch (ParseException e) {
                        e.printStackTrace();
                    }

                        // If event is in range (EXPORT/JSON):
                    if (inRange) {
                        if (export) {
                            tempICal.addEvent(event);
                        } else {
                            Map<String, String> map = new HashMap<>();
                            map.put("id", event.getUid().getValue());
                            map.put("resourceId", ical.getNames().get(0).getValue());
                            map.put("title", event.getSummary().getValue());
                            map.put("start", isoDF.format(event.getDateStart().getValue()));
                            if (event.getDateEnd() != null) map.put("end", isoDF.format(event.getDateEnd().getValue()));
                            map.put("url", event.getUrl().getValue());
                            if (event.getDescription() != null) map.put("description", event.getDescription().getValue());
                            if (event.getLocation() != null ) map.put("location", event.getLocation().getValue());
                            json.add(map);
                        }
                    }
                }
            }

                // Return the events (EXPORT/JSON):
            if (export) {
                File tempFile = File.createTempFile(id, ".ics");
                tempICal.write(tempFile);

                OutputStream out = resp.getOutputStream();
                FileInputStream in = new FileInputStream(file);
                byte[] buffer = new byte[4096];
                int length;

                while ((length = in.read(buffer)) > 0){
                    out.write(buffer, 0, length);
                }

                in.close();
                out.flush();
            } else {
                PrintWriter out = resp.getWriter();
                out.print(new Gson().toJson(json));
                out.flush();
                out.close();
            }
        }
    }
}
