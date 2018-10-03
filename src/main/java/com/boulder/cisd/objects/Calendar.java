package com.boulder.cisd.objects;

import biweekly.ICalendar;
import com.boulder.cisd.util.CloudStorageHelper;
import com.googlecode.objectify.annotation.Entity;
import com.googlecode.objectify.annotation.Id;

import java.io.IOException;

@Entity
public class Calendar {

    @Id private String id;
    private String icsUrl;
    private String blobName;

    private Calendar() {}

    public Calendar(String id, ICalendar ical, String contextPath) throws IOException {
        this.id = id;
        this.icsUrl = new CloudStorageHelper().saveCalendar(id, ical, contextPath);
        setBlobName(this.icsUrl);
    }

    public String getId() { return id; }

    public void setId(String id) {
        this.id = id;
    }

    public String getIcsUrl() {
        return icsUrl;
    }

    public void setIcsUrl(String icsUrl) {
        this.icsUrl = icsUrl;
    }

    public String getBlobName() {
        return blobName;
    }

    public void setBlobName(String blobName) {
        this.blobName = icsUrl.substring(icsUrl.indexOf("/o/") + 3, icsUrl.indexOf("?generation"));
    }
}
