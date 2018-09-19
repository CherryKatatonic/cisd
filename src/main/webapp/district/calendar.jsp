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

<div class="container pt-3 pb-3 px-0 mx-auto bg-white">
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
                    <%--<div class="form-group">
                        <label for="eventTitle">Title</label>
                        <input type="text" class="form-control" id="eventTitle" placeholder="Title" name="title">
                    </div>
                    <div class="form-check">
                        <label for="eventAllDay">All Day?</label>
                        <input type="checkbox" class="form-check-input" id="eventAllDay" value="" name="allDay">
                    </div>
                    <br>
                    <div class="custom-file">
                        <input type="file" class="custom-file-input" id="albumCover" name="file">
                        <label class="custom-file-label" for="albumCover">Cover Photo</label>
                    </div>--%>
                    <div class="form-group">
                        <input type="hidden" id="calendarId" name="id" value="district">
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