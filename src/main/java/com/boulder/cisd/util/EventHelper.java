package com.boulder.cisd.util;

import com.boulder.cisd.daos.CalendarDao;
import com.boulder.cisd.daos.UserDao;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet("/event-helper")
public class EventHelper extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        CalendarDao calDao = (CalendarDao) getServletContext().getAttribute("calDao");
        UserDao userDao = (UserDao) getServletContext().getAttribute("userDao");
        String referrer = req.getHeader("referer");

    }
}
