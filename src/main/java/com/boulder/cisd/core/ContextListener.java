package com.boulder.cisd.core;

import com.boulder.cisd.daos.CalendarDao;
import com.boulder.cisd.daos.UserDao;
import com.boulder.cisd.objects.Calendar;
import com.boulder.cisd.objects.Hash;
import com.boulder.cisd.objects.User;
import com.boulder.cisd.util.CloudStorageHelper;
import com.google.cloud.datastore.DatastoreOptions;
import com.googlecode.objectify.ObjectifyFactory;
import com.googlecode.objectify.ObjectifyService;

import javax.servlet.ServletContextEvent;
import javax.servlet.ServletContextListener;
import javax.servlet.annotation.WebListener;

@WebListener
public class ContextListener implements ServletContextListener {

    @Override
    public void contextInitialized(ServletContextEvent e) {
        ObjectifyService.init(new ObjectifyFactory(
                DatastoreOptions.newBuilder()
                        // .setHost("http://localhost:8081") // Only for local development
                        .setProjectId("cisd-org")
                        .build()
                        .getService()
        ));

        ObjectifyService.register(Hash.class);
        ObjectifyService.register(User.class);
        ObjectifyService.register(Calendar.class);

        UserDao userDao = new UserDao();
        CalendarDao calDao = new CalendarDao();

        e.getServletContext().setAttribute("storage", new CloudStorageHelper());
        e.getServletContext().setAttribute("userDao", userDao);
        e.getServletContext().setAttribute("calDao", calDao);

    }
}
