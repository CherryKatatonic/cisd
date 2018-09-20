<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>

<head>
    <link href='${request.contextPath}/res/css/lib/fullcalendar-3.9.0.min.css' rel='stylesheet' />
    <link href='${request.contextPath}/res/css/lib/fullcalendar-3.9.0.print.css' rel='stylesheet' media='print' />
</head>

<!-- DYNAMIC NAV -->
<nav class="navbar navbar-expand-md justify-content-start pb-0 pt-0" id="nav2">
    <div class="navbar pt-0 pb-0 pl-3" id="navbar2">
        <ul id="nav2-links" class="nav">
            <li class="nav-item active">
                <a class="nav-link" href="${request.contextPath}/">HOME</a>
            </li>
            <li class="nav-item">
                <a class="nav-link" href="${request.contextPath}/about">ABOUT US</a>
            </li>
            <li class="nav-item">
                <a class="nav-link" href="${request.contextPath}/athletics">ATHLETICS</a>
            </li>
            <li class="nav-item">
                <a class="nav-link" href="${request.contextPath}/departments">DEPARTMENTS</a>
            </li>
            <li class="nav-item">
                <a class="nav-link" href="${request.contextPath}/community">PARENTS & COMMUNITY</a>
            </li>
            <li class="nav-item">
                <a class="nav-link" href="${request.contextPath}/staff">STAFF</a>
            </li>
            <li class="nav-item">
                <a class="nav-link" href="${request.contextPath}/calendar">CALENDAR</a>
            </li>
        </ul>
    </div>
</nav>

<div class="container pt-3 pb-3 px-0 mx-auto bg-white text-center">
    <div class="btn-group">
        <button id="addEvent" type="button" class="btn btn-primary" data-toggle="modal" data-target="#eventForm">
            New Event
        </button>
    </div>
    <div id='calendar' class="p-5 w-100 bg-white"></div>
</div>

<!-- Event Form -->
<div class="modal fade" id="eventForm" tabindex="-1" role="dialog" aria-labelledby="formTitle" aria-hidden="true">
    <div class="modal-dialog modal-dialog-centered" role="document">
        <div class="modal-content modal-content-dark">
            <div class="modal-header modal-header-dark">
                <h5 class="modal-title" id="formTitle">New Event</h5>
                <button type="button" class="close close-dark" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                </button>
            </div>
            <form action="${request.contextPath}/calendar" method="post" enctype="multipart/form-data">
                <div class="modal-body">
                    <!-- CALENDARS -->
                    <fieldset class="form-group pr-0" id="calendarsContainer">
                        <legend class="input-group-text mb-3 justify-content-center">
                            Which calendars should this event be added to?
                        </legend>
                        <div class="row">
                            <div class="col-md-6">
                                <div class="custom-control custom-checkbox">
                                    <input class="custom-control-input" type="checkbox" value="" name="athletics" id="athletics">
                                    <label class="custom-control-label" for="athletics">Athletics</label>
                                </div>
                                <div class="custom-control custom-checkbox">
                                    <input class="custom-control-input" type="checkbox" value="" name="carroll" id="carroll">
                                    <label class="custom-control-label" for="carroll">Carroll Elementary</label>
                                </div>
                                <div class="custom-control custom-checkbox">
                                    <input class="custom-control-input" type="checkbox" value="" name="chs" id="chs">
                                    <label class="custom-control-label" for="chs">Corsicana High School</label>
                                </div>
                                <div class="custom-control custom-checkbox">
                                    <input class="custom-control-input" type="checkbox" value="" name="cms" id="cms">
                                    <label class="custom-control-label" for="cms">Corsicana Middle School</label>
                                </div>
                                <div class="custom-control custom-checkbox">
                                    <input class="custom-control-input" type="checkbox" value="" name="navarro" id="navarro">
                                    <label class="custom-control-label" for="navarro">Navarro Elementary</label>
                                </div>
                            </div>
                            <div class="col-md-6">
                                <div class="custom-control custom-checkbox">
                                    <input class="custom-control-input" type="checkbox" value="" name="bowie" id="bowie">
                                    <label class="custom-control-label" for="bowie">Bowie Elementary</label>
                                </div>
                                <div class="custom-control custom-checkbox">
                                    <input class="custom-control-input" type="checkbox" value="" name="collins" id="collins">
                                    <label class="custom-control-label" for="collins">Collins Intermediate</label>
                                </div>
                                <div class="custom-control custom-checkbox">
                                    <input class="custom-control-input" type="checkbox" value="" name="district" id="district" checked disabled>
                                    <label class="custom-control-label" for="district">Corsicana ISD</label>
                                </div>
                                <div class="custom-control custom-checkbox">
                                    <input class="custom-control-input" type="checkbox" value="" name="fannin" id="fannin">
                                    <label class="custom-control-label" for="fannin">Fannin Elementary</label>
                                </div>
                                <div class="custom-control custom-checkbox">
                                    <input class="custom-control-input" type="checkbox" value="" name="samHouston" id="samHouston">
                                    <label class="custom-control-label" for="samHouston">Sam Houston Elementary</label>
                                </div>
                            </div>
                        </div>
                    </fieldset>
                    <!-- TITLE/SUMMARY -->
                    <fieldset class="form-group">
                        <legend class="input-group-text justify-content-center">Title/Summary</legend>
                        <input type="text" class="form-control" id="eventTitle" placeholder="Title/Summary" name="title">
                    </fieldset>
                    <!-- ALL DAY CHECK -->
                    <fieldset class="form-group mx-auto my-4" style="width: fit-content">
                        <legend class="input-group-text justify-content-center">All-Day/Multi-Day</legend>
                        <div class="custom-control custom-checkbox">
                            <input class="custom-control-input" type="checkbox" value="" name="allDay" id="allDay">
                            <label class="custom-control-label" for="allDay">
                                Check if this is an all-day event
                            </label>
                        </div>
                    </fieldset>
                    <!-- START DATE -->
                    <fieldset class="form-group">
                        <legend class="input-group-text justify-content-center">Date & Time</legend>
                            <div class="row">
                                <div class="col">
                                    <div class="input-group">
                                        <div class="input-group-prepend">
                                            <label for="eventStartDate" class="input-group-text">Start Date</label>
                                        </div>
                                        <input type="text" class="form-control" id="eventStartDate" placeholder="mm/dd/yyyy" name="startDate">
                                    </div>
                                </div>

                                <div class="col">
                                    <div class="input-group-prepend">
                                        <label for="eventStartTime" class="input-group-text">Start Time</label>
                                    </div>
                                </div>
                                <div class="col">
                                    <input type="text" class="form-control" id="eventStartTime" placeholder="0:00" name="startTime">
                                </div>
                                <%--<div class="col-md-6">
                                    <div class="input-group justify-content-center">
                                        <label for="eventStartDate" class="input-group-text">Start Date</label>
                                    </div>
                                    <input type="text" class="form-control" id="eventStartDate" placeholder="mm/dd/yyyy" name="startDate">
                                </div>
                                <div class="col-md-6">
                                    <div class="input-group justify-content-center">
                                        <label for="eventStartTime" class="input-group-text">Start Time</label>
                                    </div>
                                    <input type="text" class="form-control" id="eventStartTime" placeholder="0:00" name="startTime">
                                </div>--%>
                            </div>
                            <hr/>
                            <div class="row mt-2">
                                <div class="col-md-6">
                                    <div class="input-group justify-content-center">
                                        <label for="eventEndDate" class="input-group-text">End Date</label>
                                    </div>
                                    <input type="text" class="form-control" id="eventEndDate" placeholder="mm/dd/yyyy" name="endDate">
                                </div>
                                <div class="col-md-6">
                                    <div class="input-group justify-content-center">
                                        <label for="eventEndTime" class="input-group-text">&nbsp;End Time&nbsp;</label>
                                    </div>
                                    <input type="text" class="form-control" id="eventEndTime" placeholder="0:00" name="endTime">
                                </div>
                            </div>
                    </fieldset>
                    <!-- DESCRIPTION -->
                    <div class="form-group">
                        <div class="input-group">
                            <label class="input-group-text" for="eventDescription">Description (optional)</label>
                        </div>
                        <input type="text" class="form-control" id="eventDescription" placeholder="Event description" name="description">
                    </div>
                    <!-- LOCATION -->
                    <div class="form-group">
                        <div class="input-group">
                            <label class="input-group-text" for="eventLocation">Location (optional)</label>
                        </div>
                        <input type="text" class="form-control" id="eventLocation" placeholder="Event location" name="location">
                    </div>
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-primary-outline" data-dismiss="modal">Cancel</button>
                    <input type="submit" class="btn btn-primary" value="Save">
                </div>
            </form>
        </div>
    </div>
</div>