package com.boulder.cisd.util;

import biweekly.Biweekly;
import biweekly.ICalendar;
import biweekly.component.VEvent;
import biweekly.property.DateStart;
import biweekly.property.Summary;
import biweekly.property.Uid;
import biweekly.util.Duration;
import biweekly.util.Frequency;
import biweekly.util.Recurrence;
import com.boulder.cisd.objects.Calendar;

import java.io.File;
import java.io.IOException;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.time.Instant;
import java.util.Date;

public class iCalTest {

    public static void write() throws IOException {
        ICalendar ical = new ICalendar();
        VEvent event = new VEvent();
        Summary summary = event.setSummary("Team Meeting");
        summary.setLanguage("en-us");

        Date start = new Date();
        event.setDateStart(start);

        Duration duration = new Duration.Builder().hours(1).build();
        event.setDuration(duration);

        Recurrence recur = new Recurrence.Builder(Frequency.WEEKLY).interval(2).build();
        event.setRecurrenceRule(recur);
        ical.addEvent(event);

        new File(System.getenv("CATALINA_BASE") + "/storage/calendars").mkdirs();
        File file = new File(System.getenv("CATALINA_BASE") + "/storage/calendars/myCal.ics");
        file.createNewFile();

        Biweekly.write(ical).go(file);
    }

    public static VEvent createEvent() {
        String startDateStr = "2018-09-18";
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
        e.setSummary(new RandomString(10).nextString());
        e.setDescription(new RandomString(30).nextString());
        e.setDateStart(new DateStart(startDate, false));
        e.setLocation(new RandomString(20).nextString());

        return e;
    }

    public static void addEvent(Calendar cal) throws IOException {
        String startDateStr = "2018-09-18";
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

        File file = new File(cal.getIcsUrl());
        ICalendar ical = Biweekly.parse(file).first();
        ical.addEvent(e);
        Biweekly.write(ical).go(file);
    }

}
