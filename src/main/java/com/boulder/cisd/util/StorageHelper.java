package com.boulder.cisd.util;

import biweekly.Biweekly;
import biweekly.ICalendar;

import java.io.File;
import java.io.IOException;

public class StorageHelper {

    public static String getCalendarUrl(String id, ICalendar ical) throws IOException {
        new File(System.getenv("CATALINA_BASE") + "/storage/calendars").mkdirs();
        File file = new File(
                System.getenv("CATALINA_BASE")
                + "/storage/calendars/"
                + id + ".ics");
        file.createNewFile();

        Biweekly.write(ical).go(file);
        System.out.println(file.toString());
        return file.toString();
    }

}
