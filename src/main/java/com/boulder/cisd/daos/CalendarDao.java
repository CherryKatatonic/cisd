package com.boulder.cisd.daos;

import com.boulder.cisd.objects.Calendar;
import com.googlecode.objectify.Key;

import static com.googlecode.objectify.ObjectifyService.ofy;

public class CalendarDao {

    public Calendar getCalendar(String id) {
        return ofy().load().key(Key.create(Calendar.class, id)).now();
    }

    public Calendar saveCalendar(Calendar cal) {
        Key<Calendar> key = ofy().save().entity(cal).now();
        return ofy().load().key(key).now();
    }



}
