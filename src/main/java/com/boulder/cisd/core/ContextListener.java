package com.boulder.cisd.core;

import com.boulder.cisd.daos.CalendarDao;
import com.boulder.cisd.daos.UserDao;
import com.boulder.cisd.objects.Calendar;
import com.boulder.cisd.objects.Hash;
import com.boulder.cisd.objects.User;
import com.boulder.cisd.util.CloudStorageHelper;
import com.boulder.cisd.util.GcloudCredentialHelper;
import com.google.auth.oauth2.GoogleCredentials;
import com.google.cloud.datastore.DatastoreOptions;
import com.googlecode.objectify.ObjectifyFactory;
import com.googlecode.objectify.ObjectifyService;

import javax.servlet.ServletContextEvent;
import javax.servlet.ServletContextListener;
import javax.servlet.annotation.WebListener;

@WebListener
public class ContextListener implements ServletContextListener {

    @Override
    public void contextInitialized(ServletContextEvent sce) {
        GoogleCredentials credentials = GcloudCredentialHelper.getDefaultCredentials();

        ObjectifyService.init(new ObjectifyFactory(
                DatastoreOptions.newBuilder()
                        .setCredentials(credentials)
                        .setProjectId("cisd-org")
                        .setHost(System.getProperty("DATASTORE_EMULATOR_HOST"))
                        .build().getService()));

        ObjectifyService.register(Hash.class);
        ObjectifyService.register(User.class);
        ObjectifyService.register(Calendar.class);

        UserDao userDao = new UserDao();
        CalendarDao calendarDao = new CalendarDao();
        sce.getServletContext().setAttribute("userDao", userDao);
        sce.getServletContext().setAttribute("calendarDao", calendarDao);

        sce.getServletContext().setAttribute("storage", new CloudStorageHelper(credentials));
    }
}
