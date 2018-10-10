package com.boulder.cisd.daos;

import com.boulder.cisd.objects.Page;
import com.googlecode.objectify.Key;

import static com.googlecode.objectify.ObjectifyService.ofy;

public class PageDao {

    public Page createPage(Page page) {
        Key<Page> key = ofy().save().entity(page).now();
        return ofy().load().key(key).now();
    }

    public Page getPage(String id) {
        return ofy().load().key(Key.create(Page.class, id)).now();
    }

    public void updatePage(Page page) {
        ofy().save().entity(page).now();
    }

    public void deletePage(String id) {
        ofy().delete().key(Key.create(Page.class, id)).now();
    }

}
