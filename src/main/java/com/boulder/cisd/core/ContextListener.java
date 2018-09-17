package com.boulder.cisd.core;

import biweekly.ICalendar;
import com.boulder.cisd.auth.PasswordStorage;
import com.boulder.cisd.daos.CalendarDao;
import com.boulder.cisd.daos.UserDao;
import com.boulder.cisd.objects.Calendar;
import com.boulder.cisd.objects.Hash;
import com.boulder.cisd.objects.User;
import com.google.cloud.datastore.DatastoreOptions;
import com.googlecode.objectify.ObjectifyFactory;
import com.googlecode.objectify.ObjectifyService;

import javax.servlet.ServletContextEvent;
import javax.servlet.ServletContextListener;
import javax.servlet.annotation.WebListener;
import java.io.IOException;

@WebListener
public class ContextListener implements ServletContextListener {

    @Override
    public void contextInitialized(ServletContextEvent e) {
        ObjectifyService.init(new ObjectifyFactory(
                DatastoreOptions.newBuilder()
                        .setHost("http://localhost:8081")
                        .setProjectId("cisd-org")
                        .build()
                        .getService()
        ));

        ObjectifyService.register(User.class);
        ObjectifyService.register(Hash.class);
        ObjectifyService.register(Calendar.class);

        UserDao userDao = new UserDao();
        CalendarDao calDao = new CalendarDao();

        e.getServletContext().setAttribute("userDao", userDao);
        e.getServletContext().setAttribute("calDao", calDao);

        ObjectifyService.run(() -> {
            if (userDao.getAdminPass() == null) {
                try {
                    Hash adminPass = new Hash("adminPass", PasswordStorage.createHash("Tigers@dm1n337"));
                } catch (PasswordStorage.CannotPerformOperationException e1) {
                    e1.printStackTrace();
                }
            }

            if (calDao.getCalendar("district") == null) {
                ICalendar ical = new ICalendar();
                ical.setName("CISD Calendar");
                ical.setDescription("Corsicana ISD Events Calendar");
                ical.setUrl("localhost:8080/calendar");
                Calendar cal = null;

                try {
                    cal = new Calendar("district", ical);
                } catch (IOException e1) {
                    e1.printStackTrace();
                }

                calDao.createCalendar(cal);
            }

            return null;
        });

    }
}
