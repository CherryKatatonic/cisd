package com.boulder.cisd.util;

import biweekly.ICalVersion;
import biweekly.ICalendar;
import biweekly.component.VEvent;
import biweekly.io.TimezoneAssignment;
import biweekly.io.TimezoneInfo;
import biweekly.property.CalendarScale;
import biweekly.property.ProductId;
import biweekly.property.Uid;
import biweekly.util.Duration;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.time.Instant;
import java.util.Date;
import java.util.TimeZone;

public class CalendarHelper {

    public static ICalendar createCalendar(String name) {
        ICalendar ical = new ICalendar();
        ical.setName(name);
        ical.setVersion(ICalVersion.V2_0);
        ical.setProductId(ProductId.biweekly());
        ical.setCalendarScale(CalendarScale.gregorian());
        ical.setUid(Uid.random());
        ical.setLastModified(new Date());
        ical.setRefreshInterval(Duration.builder().hours(6).build());
        TimezoneInfo tzi = new TimezoneInfo();
        tzi.setDefaultTimezone(TimezoneAssignment.download(TimeZone.getTimeZone("America/Chicago"), true));
        ical.setTimezoneInfo(tzi);

        /////////////////////// TEST //////////////////////////
        /*String startDateStr = "2018-09-18";
        String endDateStr = "2018-09-19";
        SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
        Date startDate = null;
        Date endDate = null;

        try {
            startDate = sdf.parse(startDateStr);
            endDate = sdf.parse(endDateStr);
        } catch (ParseException e) {
            e.printStackTrace();
        }

        VEvent e = new VEvent();
        e.setUid(Uid.random());
        e.setDateTimeStamp(Date.from(Instant.now()));
        e.setSummary("Test Event 1");
        e.setDescription("The first event created for testing purposes");
        e.setDateStart(new DateStart(startDate, false));
        e.setLocation("Tiger Stadium");

        ical.addEvent(e);*/
        ///////////////////////////////////////////////////////
        return ical;
    }

    public static VEvent createEvent(HttpServletRequest req, HttpServletResponse resp) throws ParseException {
        SimpleDateFormat df = new SimpleDateFormat("yyyy-MM-dd");
        SimpleDateFormat dtf = new SimpleDateFormat("yyyy-MM-dd'T'HH:mm");

        String[] cals = req.getParameterValues("calendar");

        String title = req.getParameter("title"),
                sDateStr = req.getParameter("sDate"),
                sTimeStr = req.getParameter("sDate"),
                eDateStr = req.getParameter("eDate"),
                eTimeStr = req.getParameter("eTime"),
                desc = req.getParameter("desc"),
                loc = req.getParameter("loc");

        boolean allDay = Boolean.parseBoolean(req.getParameter("allDay")),
                recurring = Boolean.parseBoolean(req.getParameter("recurring"));


        Date sDate, eDate;

        if (allDay) {
            sDate = df.parse(sDateStr);
        } else {
            sDate = dtf.parse(sDateStr.concat(sTimeStr));
        }

        if (eDateStr != null && !eDateStr.equals(sDateStr)) {
            if (allDay) {
                eDate = df.parse(eDateStr);
            } else {
                eDate = dtf.parse(eDateStr.concat(eTimeStr));
            }
        } else {
            eDate = null;
        }

        VEvent event = new VEvent();
        event.setUid(Uid.random());
        event.setDateTimeStamp(Date.from(Instant.now()));
        event.setSummary(title);
        event.setDateStart(sDate);
        if (eDate != null) event.setDateEnd(eDate);
        // TODO - if (recurring)...
        if (desc != null) event.setDescription(desc);
        if (loc != null) event.setLocation(loc);
        event.addCategories(cals);
        // TODO - set URL...
        return null;
    }
}
