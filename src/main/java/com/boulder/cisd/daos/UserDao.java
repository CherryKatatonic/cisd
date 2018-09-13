package com.boulder.cisd.daos;

import com.boulder.cisd.objects.Hash;
import com.boulder.cisd.objects.User;
import com.googlecode.objectify.Key;
import com.googlecode.objectify.cmd.Query;

import static com.googlecode.objectify.ObjectifyService.ofy;

public class UserDao {

    public User createUser(User user) {
        Key<User> key = ofy().save().entity(user).now();
        return ofy().load().key(key).now();
    }

    public User getUser(Long id) {
        return ofy().load().key(Key.create(User.class, id)).now();
    }

    public User getUser(String email) {
        Query<User> query = ofy().load().type(User.class);
        User user = query.filter("email", email).first().now();

        if (user != null) { return user; }
        return null;
    }

    public User updateUser(User user) {
        ofy().save().entity(user).now();
        return user;
    }

    public void deleteUser(Long id) {
        ofy().delete().key(Key.create(User.class, id)).now();
    }

    public String getAdminPass() {
        return ofy().load().key(Key.create(Hash.class, "adminPass")).now().getContent();
    }
}
