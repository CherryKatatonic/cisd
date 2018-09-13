package com.boulder.cisd.objects;

import com.googlecode.objectify.annotation.Entity;
import com.googlecode.objectify.annotation.Id;

import static com.googlecode.objectify.ObjectifyService.ofy;

@Entity
public class Hash {

    @Id private String id;
    private String content;

    private Hash() {}

    public Hash(String id, String content) {
        this.id = id;
        this.content = content;
        ofy().save().entity(this).now();
    }

    public String getId() {
        return id;
    }

    public void setId(String id) {
        this.id = id;
    }

    public String getContent() {
        return content;
    }

    public Hash setContent(String content) {
        return ofy().transact(() -> {
            Hash hash = ofy().load().entity(this).now();
            hash.content = content;
            ofy().save().entity(hash).now();
            return hash;
        });
    }
}
