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
        return ical;
    }

    public static VEvent createEvent(HttpServletRequest req) throws ParseException {
        SimpleDateFormat df = new SimpleDateFormat("MM/dd/yyyy");
        SimpleDateFormat dtf = new SimpleDateFormat("MM/dd/yyyyh:mm a");

        String category = req.getParameter("category");

        String title = req.getParameter("title"),
                startDateStr = req.getParameter("dateStart"),
                startTimeStr = req.getParameter("timeStart"),
                endDateStr = req.getParameter("dateEnd"),
                endTimeStr = req.getParameter("timeEnd"),
                description = req.getParameter("description"),
                location = req.getParameter("location"),
                contactName = req.getParameter("contactName"),
                contactPhone = req.getParameter("contactName"),
                contactEmail = req.getParameter("contactName"),
                contactWebsite = req.getParameter("contactName");

        boolean allDay = Boolean.parseBoolean(req.getParameter("allDay")),
                recurring = Boolean.parseBoolean(req.getParameter("recurring"));

        Date startDate, endDate;
        System.out.println(allDay);

        if (allDay) {
            startDate = df.parse(startDateStr);
            endDate = endDateStr.equals(startDateStr) ? startDate : df.parse(endDateStr);
        } else {
            startDate = dtf.parse(startDateStr.concat(startTimeStr));
            endDate = dtf.parse(endDateStr.concat(endTimeStr));
        }

        VEvent event = new VEvent();
        event.setUid(Uid.random());
        event.setUrl(req.getContextPath() + "/calendar/" + event.getUid().getValue());
        event.setDateTimeStamp(Date.from(Instant.now()));
        event.setLastModified(Date.from(Instant.now()));
        event.setSummary(title);
        event.setDateStart(startDate);
        event.setClassification(category);

        if (endDate != null) event.setDateEnd(endDate);
        if (description != null) event.setDescription(description);
        if (location != null) event.setLocation(location);

        // TODO - if (recurring)...
        // TODO - if (contact info)...

        return event;
    }
}
