package com.boulder.cisd.util;

import javax.servlet.FilterChain;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.annotation.WebFilter;
import javax.servlet.http.HttpFilter;
import javax.servlet.http.HttpServletRequest;
import java.io.IOException;

@WebFilter("/*")
public class DevFilter extends HttpFilter {

    @Override
    public void doFilter(ServletRequest req, ServletResponse res, FilterChain chain) throws IOException, ServletException {
        HttpServletRequest r = (HttpServletRequest) req;

        if (r.getSession().getAttribute("ack") == null) {
            req.setAttribute("devScript", "$('#devModalBtn').click();");
            r.getSession().setAttribute("ack", true);
        }

        chain.doFilter(req, res);
    }
}
