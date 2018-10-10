package com.boulder.cisd.core;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.ws.rs.GET;
import javax.ws.rs.Path;
import javax.ws.rs.PathParam;
import java.io.IOException;

@Path("/")
public class Home extends HttpServlet {

    @GET
    public void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        req.setAttribute("campus", "district");
        req.setAttribute("page", "home");
        req.getRequestDispatcher("/index.jsp").forward(req, resp);
    }

    @GET @Path("/{campus}")
    public void doGet(@PathParam("campus") String campus, HttpServletRequest req, HttpServletResponse resp)
            throws ServletException, IOException {
        req.setAttribute("campus", campus);
        req.setAttribute("page", "home");
        req.getRequestDispatcher("/index.jsp").forward(req, resp);
    }

}
