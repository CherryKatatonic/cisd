<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>

<!-- CALENDAR STYLES -->
<head>
    <link href='${request.contextPath}/res/css/lib/fullcalendar-3.9.0.min.css' rel='stylesheet' />
    <link href='${request.contextPath}/res/css/lib/fullcalendar-3.9.0.print.css' rel='stylesheet' media='print' />
    <link href='${request.contextPath}/res/css/lib/bootstrap-timepicker.css' rel='stylesheet' />
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

<!-- MAIN CONTENT -->
<div class="w-100 py-0 px-lg-5 mx-lg-auto text-center">

    <!-- ADMIN TOOLBAR -->
    <div class="container-fluid bg-white w-100 justify-content-center pt-3">
        <button id="addEvent" type="button" class="btn btn-primary" data-toggle="modal" data-target="#eventForm">
            New Event
        </button>
        <div class="dropdown btn">
            <button class="btn btn-primary dropdown-toggle" type="button" id="calendarDropdownBtn" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                Calendars
            </button>
            <div class="dropdown-menu" aria-labelledby="calendarDropdownBtn">
               <div class="custom-control custom-checkbox">
                   <input class="custom-control-input" type="checkbox" value="athletics" name="calendar" id="athletics1">
                   <label class="custom-control-label" for="athletics1">Athletics</label>
               </div>
               <div class="custom-control custom-checkbox">
                   <input class="custom-control-input" type="checkbox" value="carroll" name="calendar" id="carroll1">
                   <label class="custom-control-label" for="carroll1">Carroll Elementary</label>
               </div>
               <div class="custom-control custom-checkbox">
                   <input class="custom-control-input" type="checkbox" value="chs" name="calendar" id="chs1">
                   <label class="custom-control-label" for="chs1">Corsicana High School</label>
               </div>
               <div class="custom-control custom-checkbox">
                   <input class="custom-control-input" type="checkbox" value="cms" name="calendar" id="cms1">
                   <label class="custom-control-label" for="cms1">Corsicana Middle School</label>
               </div>
               <div class="custom-control custom-checkbox">
                   <input class="custom-control-input" type="checkbox" value="navarro" name="calendar" id="navarro1">
                   <label class="custom-control-label" for="navarro1">Navarro Elementary</label>
               </div>
               <div class="custom-control custom-checkbox">
                   <input class="custom-control-input" type="checkbox" value="bowie" name="calendar" id="bowie1">
                   <label class="custom-control-label" for="bowie1">Bowie Elementary</label>
               </div>
               <div class="custom-control custom-checkbox">
                   <input class="custom-control-input" type="checkbox" value="collins" name="calendar" id="collins1">
                   <label class="custom-control-label" for="collins1">Collins Intermediate</label>
               </div>
               <div class="custom-control custom-checkbox">
                   <input class="custom-control-input" type="checkbox" value="district" name="calendar" id="district1" checked disabled>
                   <input type="hidden" value="district" name="calendar">
                   <label class="custom-control-label" for="district1">Corsicana ISD</label>
               </div>
               <div class="custom-control custom-checkbox">
                   <input class="custom-control-input" type="checkbox" value="fannin" name="calendar" id="fannin1">
                   <label class="custom-control-label" for="fannin1">Fannin Elementary</label>
               </div>
               <div class="custom-control custom-checkbox">
                   <input class="custom-control-input" type="checkbox" value="sam" name="calendar" id="samHouston1">
                   <label class="custom-control-label" for="samHouston1">Sam Houston Elementary</label>
               </div>
                <button id="updateResources" type="button" class="btn btn-outline-primary w-100">Update Calendars</button>
            </div>
        </div>
        <div class="dropdown btn">
            <button class="btn btn-primary dropdown-toggle" type="button" id="categoryDropdownBtn" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                Categories
            </button>
            <div class="dropdown-menu" aria-labelledby="categoryDropdownBtn">
                <div class="custom-control custom-checkbox">
                    <input class="custom-control-input" type="checkbox" value="athletics" name="category" id="unassigned" checked>
                    <label class="custom-control-label" for="athletics1">Unassigned</label>
                </div>
                <div class="custom-control custom-checkbox">
                    <input class="custom-control-input" type="checkbox" value="carroll" name="category" id="academicQuiz" checked>
                    <label class="custom-control-label" for="carroll1">Academic - Quiz</label>
                </div>
                <div class="custom-control custom-checkbox">
                    <input class="custom-control-input" type="checkbox" value="chs" name="category" id="academicTest" checked>
                    <label class="custom-control-label" for="chs1">Academic - Test (Classroom)</label>
                </div>
                <div class="custom-control custom-checkbox">
                    <input class="custom-control-input" type="checkbox" value="cms" name="category" id="athleticEvent" checked>
                    <label class="custom-control-label" for="cms1">Athletic Event</label>
                </div>
                <div class="custom-control custom-checkbox">
                    <input class="custom-control-input" type="checkbox" value="navarro" name="category" id="athleticPractice" checked>
                    <label class="custom-control-label" for="navarro1">Athletic Practice</label>
                </div>
                <div class="custom-control custom-checkbox">
                    <input class="custom-control-input" type="checkbox" value="bowie" name="category" id="districtTest" checked>
                    <label class="custom-control-label" for="bowie1">District Testing</label>
                </div>
                <div class="custom-control custom-checkbox">
                    <input class="custom-control-input" type="checkbox" value="collins" name="category" id="holiday" checked>
                    <label class="custom-control-label" for="collins1">Holiday</label>
                </div>
                <div class="custom-control custom-checkbox">
                    <input class="custom-control-input" type="checkbox" value="district" name="category" id="homework" checked>
                    <label class="custom-control-label" for="district1">Homework</label>
                </div>
                <div class="custom-control custom-checkbox">
                    <input class="custom-control-input" type="checkbox" value="fannin" name="category" id="musicArt" checked>
                    <label class="custom-control-label" for="fannin1">Music or Art Event</label>
                </div>
                <div class="custom-control custom-checkbox">
                    <input class="custom-control-input" type="checkbox" value="sam" name="category" id="parentTeacher" checked>
                    <label class="custom-control-label" for="samHouston1">Parent Teacher Conference</label>
                </div>
                <div class="custom-control custom-checkbox">
                    <input class="custom-control-input" type="checkbox" value="bowie" name="category" id="ptoPTA" checked>
                    <label class="custom-control-label" for="bowie1">PTO/PTA Meeting</label>
                </div>
                <div class="custom-control custom-checkbox">
                    <input class="custom-control-input" type="checkbox" value="collins" name="category" id="boardMeeting" checked>
                    <label class="custom-control-label" for="collins1">School Board Meeting</label>
                </div>
                <div class="custom-control custom-checkbox">
                    <input class="custom-control-input" type="checkbox" value="district" name="category" id="staffDevOp" checked>
                    <label class="custom-control-label" for="district1">Staff Development Opportunity</label>
                </div>
                <div class="custom-control custom-checkbox">
                    <input class="custom-control-input" type="checkbox" value="fannin" name="category" id="staffDevWorkday" checked>
                    <label class="custom-control-label" for="fannin1">Staff Development or Work Day</label>
                </div>
                <div class="custom-control custom-checkbox">
                    <input class="custom-control-input" type="checkbox" value="sam" name="category" id="uilAcademics" checked>
                    <label class="custom-control-label" for="samHouston1">UIL Academics/Fine Arts</label>
                </div>
                <button id="updateCategories" type="button" class="btn btn-outline-primary w-100">Update Categories</button>
            </div>
        </div>
    </div>

    <!-- CALENDAR -->
    <div id='calendar' class="px-md-5 py-5 w-100 bg-white"></div>

</div>

<!-- NEW EVENT FORM -->
<div class="modal fade pr-0" id="eventForm" tabindex="-1" role="dialog" aria-labelledby="formTitle" aria-hidden="true">
    <div class="modal-dialog modal-dialog-centered" role="document" style="max-width: 524px;">
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
                        <legend class="input-group-text justify-content-center">
                            Which calendars should this event be added to?
                        </legend>
                        <div class="row">
                            <div class="col-md-6">
                                <div class="custom-control custom-checkbox">
                                    <input class="custom-control-input" type="checkbox" value="athletics" name="calendar" id="athletics">
                                    <label class="custom-control-label" for="athletics">Athletics</label>
                                </div>
                                <div class="custom-control custom-checkbox">
                                    <input class="custom-control-input" type="checkbox" value="carroll" name="calendar" id="carroll">
                                    <label class="custom-control-label" for="carroll">Carroll Elementary</label>
                                </div>
                                <div class="custom-control custom-checkbox">
                                    <input class="custom-control-input" type="checkbox" value="chs" name="calendar" id="chs">
                                    <label class="custom-control-label" for="chs">Corsicana High School</label>
                                </div>
                                <div class="custom-control custom-checkbox">
                                    <input class="custom-control-input" type="checkbox" value="cms" name="calendar" id="cms">
                                    <label class="custom-control-label" for="cms">Corsicana Middle School</label>
                                </div>
                                <div class="custom-control custom-checkbox">
                                    <input class="custom-control-input" type="checkbox" value="navarro" name="calendar" id="navarro">
                                    <label class="custom-control-label" for="navarro">Navarro Elementary</label>
                                </div>
                            </div>
                            <div class="col-md-6">
                                <div class="custom-control custom-checkbox">
                                    <input class="custom-control-input" type="checkbox" value="bowie" name="calendar" id="bowie">
                                    <label class="custom-control-label" for="bowie">Bowie Elementary</label>
                                </div>
                                <div class="custom-control custom-checkbox">
                                    <input class="custom-control-input" type="checkbox" value="collins" name="calendar" id="collins">
                                    <label class="custom-control-label" for="collins">Collins Intermediate</label>
                                </div>
                                <div class="custom-control custom-checkbox">
                                    <input class="custom-control-input" type="checkbox" value="district" name="calendar" id="district" checked disabled>
                                    <input type="hidden" value="district" name="calendar">
                                    <label class="custom-control-label" for="district">Corsicana ISD</label>
                                </div>
                                <div class="custom-control custom-checkbox">
                                    <input class="custom-control-input" type="checkbox" value="fannin" name="calendar" id="fannin">
                                    <label class="custom-control-label" for="fannin">Fannin Elementary</label>
                                </div>
                                <div class="custom-control custom-checkbox">
                                    <input class="custom-control-input" type="checkbox" value="sam" name="calendar" id="samHouston">
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

                    <!-- SCHEDULING -->
                    <fieldset class="form-group">
                        <legend class="input-group-text justify-content-center">Date & Time</legend>

                        <!-- ALL-DAY/RECURRING -->
                        <div class="row">
                            <div class="col-6">
                                <input class="" type="checkbox" value="true" name="allDay" id="allDay">
                                <label class="checkbox-center" for="allDay">All-Day Event</label>
                            </div>

                            <div class="col-6">
                                <input class="" type="checkbox" value="true" name="recurring" id="recurring">
                                <label class="checkbox-center" for="recurring">Recurring Event</label>
                            </div>
                        </div>

                        <!-- START DATE/TIME -->
                        <div class="row">

                            <!-- START DATE -->
                            <div class="col-sm-6">
                                <div class="input-group">
                                    <div class="input-group-prepend">
                                        <label for="eventStartDate" class="input-group-text">Start Date</label>
                                    </div>
                                    <input type="text" class="form-control" id="eventStartDate" placeholder="mm/dd/yyyy" name="startDate">
                                </div>
                            </div>

                            <!-- START TIME -->
                            <div class="col-sm-6">
                                <div class="input-group">
                                    <div class="input-group-prepend">
                                        <label for="eventStartTime" class="input-group-text">Start Time</label>
                                    </div>
                                    <input type="text" class="form-control" id="eventStartTime" placeholder="0:00" name="startTime">
                                </div>
                            </div>

                        </div>

                        <hr/> <!-- DIVIDER -->

                        <!-- END DATE/TIME -->
                        <div class="row mt-2">

                            <!-- END DATE -->
                            <div class="col-sm-6">
                                <div class="input-group">
                                    <div class="input-group-prepend">
                                        <label for="eventEndDate" class="input-group-text">&nbsp;End Date&nbsp;</label>
                                    </div>
                                    <input type="text" class="form-control" id="eventEndDate" placeholder="mm/dd/yyyy" name="endDate">
                                </div>
                            </div>

                            <!-- END TIME -->
                            <div class="col-sm-6">
                                <div class="input-group">
                                    <div class="input-group-prepend">
                                        <label for="eventEndTime" class="input-group-text">&nbsp;End Time&nbsp;</label>
                                    </div>
                                    <input type="text" class="form-control" id="eventEndTime" placeholder="0:00" name="endTime">
                                </div>
                            </div>

                        </div>

                    </fieldset>

                    <!-- ADDITIONAL INFO -->
                    <fieldset class="form-group">
                        <legend class="input-group-text justify-content-center">Additional Info</legend>

                        <!-- DESCRIPTION -->
                        <div class="form-group">
                            <div class="input-group">
                                <label class="input-group-text" for="eventDescription">Description (optional)</label>
                            </div>
                            <textarea type="textarea" class="form-control" id="eventDescription" placeholder="Event description" name="description"></textarea>
                        </div>

                        <!-- LOCATION -->
                        <div class="form-group">
                            <div class="input-group">
                                <label class="input-group-text" for="eventLocation">Location (optional)</label>
                            </div>
                            <input type="text" class="form-control" id="eventLocation" placeholder="Event location" name="location">
                        </div>

                    </fieldset>

                </div>

                <!-- SAVE/CANCEL -->
                <div class="modal-footer">
                    <button type="button" class="btn btn-primary-outline" data-dismiss="modal">Cancel</button>
                    <input type="submit" class="btn btn-primary" value="Save">
                </div>

            </form>
        </div>
    </div>
</div>