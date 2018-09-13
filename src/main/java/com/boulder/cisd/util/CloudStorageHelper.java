package com.boulder.cisd.util;

import com.google.cloud.storage.Acl;
import com.google.cloud.storage.BlobInfo;
import com.google.cloud.storage.Storage;
import com.google.cloud.storage.StorageOptions;
import org.joda.time.DateTime;
import org.joda.time.DateTimeZone;
import org.joda.time.format.DateTimeFormat;
import org.joda.time.format.DateTimeFormatter;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;
import java.io.IOException;
import java.nio.file.Paths;
import java.util.ArrayList;
import java.util.Arrays;

public class CloudStorageHelper {

    private static Storage storage = null;
    static { storage = StorageOptions.getDefaultInstance().getService(); }

    @SuppressWarnings("deprecation")
    public String uploadFile(Part filePart, final String bucketName) throws IOException {
        DateTimeFormatter dtf = DateTimeFormat.forPattern("-YYYY-MM-dd-HHmmssSSS");
        DateTime dt = DateTime.now(DateTimeZone.UTC);
        String dtString = dt.toString(dtf);
        final String fileName = filePart.getSubmittedFileName() + dtString;

        BlobInfo blobInfo = storage.create(
                BlobInfo
                        .newBuilder(bucketName, fileName)
                        .setAcl(new ArrayList<>(Arrays.asList(Acl.of(Acl.User.ofAllUsers(), Acl.Role.READER))))
                        .build(),
                filePart.getInputStream());
        return blobInfo.getMediaLink();
    }

    public String getImageUrl(HttpServletRequest req, HttpServletResponse resp, final String bucket)
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
                    return this.uploadFile(filePart, bucket);
                }
            }
            throw new ServletException("file must be an image");
        }
        return imageUrl;
    }

}
