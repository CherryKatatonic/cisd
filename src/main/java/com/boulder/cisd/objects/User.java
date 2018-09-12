package com.boulder.cisd.objects;

import com.googlecode.objectify.annotation.Entity;
import com.googlecode.objectify.annotation.Id;
import com.googlecode.objectify.annotation.Index;

import static com.googlecode.objectify.ObjectifyService.ofy;

@Entity
public class User {

    @Id private Long id;
    @Index private String email;
    private String password;
    private String token;
    private boolean emailVerified;

    private User() {}

    private User(Builder builder) {
        this.id = builder.id;
        this.email = builder.email;
        this.password = builder.password;
        this.token = builder.token;
        this.emailVerified = builder.emailVerified;
    }

    public static class Builder {
        private Long id;
        private String email, password, token;
        private boolean emailVerified;

        public Builder id(Long id) {
            this.id = id;
            return this;
        }

        public Builder email(String email) {
            this.email = email;
            return this;
        }

        public Builder password(String password) {
            this.password = password;
            return this;
        }

        public Builder emailVerified(boolean verified) {
            this.emailVerified = verified;
            return this;
        }

        public User build() {
            return new User(this);
        }
    }

    public Long getId() {
        return id;
    }

    public String getEmail() {
        return email;
    }

    public User setEmail(String email) {
        return ofy().transact(() -> {
           User user = ofy().load().entity(this).now();
           user.email = email;
           ofy().save().entity(user).now();
           return user;
        });
    }

    public String getPassword() {
        return password;
    }

    public User setPassword(String password) {
        return ofy().transact(() -> {
            User user = ofy().load().entity(this).now();
            user.password = password;
            ofy().save().entity(user).now();
            return user;
        });
    }

    public boolean getEmailVerified() {
        return emailVerified;
    }

    public User setEmailVerified(boolean emailVerified) {
        return ofy().transact(() -> {
            User user = ofy().load().entity(this).now();
            user.emailVerified = emailVerified;
            ofy().save().entity(user).now();
            return user;
        });
    }
}
