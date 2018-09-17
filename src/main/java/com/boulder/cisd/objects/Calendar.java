package com.boulder.cisd.objects;

import biweekly.ICalVersion;
import biweekly.ICalendar;
import biweekly.io.TimezoneAssignment;
import biweekly.io.TimezoneInfo;
import biweekly.property.CalendarScale;
import biweekly.property.ProductId;
import biweekly.property.Uid;
import biweekly.util.Duration;
import com.boulder.cisd.util.StorageHelper;
import com.googlecode.objectify.annotation.Entity;
import com.googlecode.objectify.annotation.Id;

import java.io.IOException;
import java.util.Date;
import java.util.TimeZone;

@Entity
public class Calendar {

    @Id private String id;
    private String icsUrl;

    private Calendar() {}

    public Calendar(String id, ICalendar ical) throws IOException {
        this.id = id;
        ical.setVersion(ICalVersion.V2_0);
        ical.setProductId(ProductId.biweekly());
        ical.setCalendarScale(CalendarScale.gregorian());
        ical.setUid(Uid.random());
        ical.setLastModified(new Date());
        ical.setRefreshInterval(Duration.builder().hours(6).build());
        TimezoneInfo tzi = new TimezoneInfo();
        tzi.setDefaultTimezone(TimezoneAssignment.download(TimeZone.getTimeZone("America/Chicago"), true));
        ical.setTimezoneInfo(tzi);
        this.icsUrl = StorageHelper.getCalendarUrl(id, ical);
        ical.setSource(icsUrl);
    }

    public String getId() {
        return id;
    }

    public void setId(String id) {
        this.id = id;
    }

    public String getIcsUrl() {
        return icsUrl;
    }

    public void setIcsUrl(String icsUrl) {
        this.icsUrl = icsUrl;
    }
}
