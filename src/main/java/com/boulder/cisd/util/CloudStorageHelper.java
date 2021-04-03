package com.boulder.cisd.util;

import biweekly.Biweekly;
import biweekly.ICalendar;
import com.google.auth.oauth2.GoogleCredentials;
import com.google.cloud.storage.*;
import org.apache.commons.io.IOUtils;
import org.joda.time.DateTime;
import org.joda.time.DateTimeZone;
import org.joda.time.format.DateTimeFormat;
import org.joda.time.format.DateTimeFormatter;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;
import java.io.File;
import java.io.IOException;
import java.nio.file.Paths;
import java.util.ArrayList;
import java.util.Arrays;

public class CloudStorageHelper {

    private final String bucket = System.getProperty("BUCKET_NAME");
    private static Storage storage = null;

    public CloudStorageHelper(GoogleCredentials credentials) {
        storage = StorageOptions.newBuilder()
                .setCredentials(credentials)
                .build().getService();
    }

    private String uploadFile(Part filePart) throws IOException {
        DateTimeFormatter dtf = DateTimeFormat.forPattern("-YYYY-MM-dd-HHmmssSSS");
        DateTime dt = DateTime.now(DateTimeZone.UTC);
        String dtString = dt.toString(dtf);
        final String fileName = filePart.getSubmittedFileName() + dtString;

        BlobInfo blobInfo = storage.create(
                BlobInfo
                        .newBuilder(bucket, fileName)
                        .setAcl(new ArrayList<>(Arrays.asList(Acl.of(Acl.User.ofAllUsers(), Acl.Role.READER))))
                        .build(),
                IOUtils.toByteArray(filePart.getInputStream()));
        return blobInfo.getMediaLink();
    }

    public String getImageUrl(HttpServletRequest req, HttpServletResponse resp)
            throws IOException, ServletException {
        Part filePart = req.getPart("file");
        final String fileName = Paths.get(filePart.getSubmittedFileName()).getFileName().toString();
        String imageUrl = "";
        if (req.getParameter("imageUrl") != null) {
            imageUrl = req.getParameter("imageUrl");
        }
        if (fileName != null && !fileName.isEmpty() && fileName.contains(".")) {
            final String extension = fileName.substring(fileName.lastIndexOf('.') + 1);
            String[] allowedExt = {"jpg", "jpeg", "png", "gif"};
            for (String s : allowedExt) {
                if (extension.equals(s)) {
                    return this.uploadFile(filePart);
                }
            }
            throw new ServletException("file must be an image");
        }
        return imageUrl;
    }

    public String saveCalendar(String id, ICalendar ical, String contextPath) throws IOException {
        File file = new File(System.getenv("CATALINA_TMPDIR") + id + ".ics");
        Biweekly.write(ical).go(file);
        BlobInfo blobInfo = storage.create(
                BlobInfo
                        .newBuilder(bucket, file.getName().substring(file.getName().indexOf("temp") + 4))
                        .setAcl(new ArrayList<>(Arrays.asList(Acl.of(Acl.User.ofAllUsers(), Acl.Role.READER))))
                        .build(),
                IOUtils.toByteArray(file.toURI()));
        if (ical.getSource() == null) {
            ical.setSource(contextPath + "/ical/" + id + "/calendar");
            saveCalendar(id, ical, contextPath);
        }
        return blobInfo.getMediaLink();
    }

    public ICalendar downloadCalendar(String id, String blobName) throws IOException {
        Storage storage = StorageOptions.getDefaultInstance().getService();
        Blob blob = storage.get(BlobId.of(System.getenv("BUCKET_NAME"), blobName));
        File file = new File(System.getenv("CATALINA_TMPDIR") + "/" + id + ".ics");
        blob.downloadTo(file.toPath());
        return Biweekly.parse(file).first();
    }

}
