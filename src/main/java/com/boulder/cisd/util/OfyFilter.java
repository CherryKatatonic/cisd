package com.boulder.cisd.util;

import com.googlecode.objectify.ObjectifyFilter;

import javax.servlet.annotation.WebFilter;

@WebFilter("/*")
public class OfyFilter extends ObjectifyFilter {}
