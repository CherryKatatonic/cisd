package com.boulder.cisd.util;

import com.google.auth.oauth2.GoogleCredentials;
import com.google.common.collect.Lists;

import javax.naming.InitialContext;
import javax.naming.NamingException;
import java.io.FileInputStream;
import java.io.IOException;

public class GcloudCredentialHelper {
    public static GoogleCredentials getDefaultCredentials() {
        GoogleCredentials credentials = null;

        try {
            credentials = GoogleCredentials.getApplicationDefault();
        } catch (IOException e) {
            System.err.println("GOOGLE_APPLICATION_CREDENTIALS environment variable not found. Checking in InitialContext...");
        }

        if (credentials == null) {
            try {
                String path = InitialContext.doLookup("java:/comp/env/GOOGLE_APPLICATION_CREDENTIALS").toString();
                credentials = GoogleCredentials.fromStream(new FileInputStream(path))
                    .createScoped(Lists.newArrayList("https://www.googleapis.com/auth/cloud-platform"));
            } catch (IOException | NamingException e) {
                System.err.println("GOOGLE_APPLICATION_CREDENTIALS not found in InitialContext.");
                e.printStackTrace();
            }
        }

        return credentials;
    }
}
