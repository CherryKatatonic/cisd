package com.boulder.cisd.util;

import com.google.auth.oauth2.GoogleCredentials;
import com.google.common.collect.Lists;

import java.io.FileInputStream;
import java.io.IOException;

public class GcloudCredentialHelper {
    public static GoogleCredentials getDefaultCredentials() {
        GoogleCredentials credentials = null;

        try {
            credentials = GoogleCredentials.getApplicationDefault();
        } catch (IOException e) {
            System.err.println("GOOGLE_APPLICATION_CREDENTIALS not found");
        }

        if (credentials == null) {
            try {
                String path = System.getProperty("GOOGLE_APPLICATION_CREDENTIALS");
                credentials = GoogleCredentials.fromStream(new FileInputStream(path))
                    .createScoped(Lists.newArrayList("https://www.googleapis.com/auth/cloud-platform"));
            } catch (IOException e) {
                System.err.println("GOOGLE_APPLICATION_CREDENTIALS not found in InitialContext.");
                e.printStackTrace();
            }
        }

        return credentials;
    }
}
