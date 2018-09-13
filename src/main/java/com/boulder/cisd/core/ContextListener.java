package com.boulder.cisd.core;

import com.boulder.cisd.auth.PasswordStorage;
import com.boulder.cisd.daos.UserDao;
import com.boulder.cisd.objects.Hash;
import com.boulder.cisd.objects.User;
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
                        .setHost("http://localhost:8081")
                        .setProjectId("cisd-org")
                        .build()
                        .getService()
        ));

        ObjectifyService.register(User.class);
        ObjectifyService.register(Hash.class);

        UserDao userDao = new UserDao();

        e.getServletContext().setAttribute("userDao", userDao);

        ObjectifyService.run(() -> {
            try {
                Hash adminPass = new Hash("adminPass", PasswordStorage.createHash("Tigers@dm1n337"));
            } catch (PasswordStorage.CannotPerformOperationException e1) {
                e1.printStackTrace();
            }
            return null;
        });

    }
}
