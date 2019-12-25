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

import javax.naming.InitialContext;
import javax.naming.NamingException;
import javax.servlet.ServletContextEvent;
import javax.servlet.ServletContextListener;
import javax.servlet.annotation.WebListener;

@WebListener
public class ContextListener implements ServletContextListener {

    @Override
    public void contextInitialized(ServletContextEvent sce) {
        GoogleCredentials credentials = GcloudCredentialHelper.getDefaultCredentials();

        try {
            ObjectifyService.init(new ObjectifyFactory(
                    DatastoreOptions.newBuilder()
                        .setCredentials(credentials)
                        .setProjectId("cisd-org")
                        .setHost(InitialContext.doLookup("java:/comp/env/DATASTORE_EMULATOR_HOST").toString())
                        .build()
                        .getService()
            ));
        } catch (NamingException e) {
            e.printStackTrace();
        }

        ObjectifyService.register(Hash.class);
        ObjectifyService.register(User.class);
        ObjectifyService.register(Calendar.class);

        UserDao userDao = new UserDao();
        CalendarDao calDao = new CalendarDao();

        try {
            sce.getServletContext().setAttribute("storage", new CloudStorageHelper(credentials));
        } catch (NamingException e) {
            e.printStackTrace();
        }
        sce.getServletContext().setAttribute("userDao", userDao);
        sce.getServletContext().setAttribute("calDao", calDao);

    }
}
