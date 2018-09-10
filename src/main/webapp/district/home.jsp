<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>

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

<!-- PHOTO CAROUSEL -->
<div id="carouselHeader" class="carousel slide" data-ride="carousel">
    <div class="carousel-inner">
        <div class="carousel-item active">
            <img class="d-block w-100" src="${request.contextPath}../res/images/photo1.JPG" alt="First slide">
        </div>
        <div class="carousel-item">
            <img class="d-block w-100" src="${request.contextPath}../res/images/photo2.jpg" alt="Second slide">
        </div>
        <div class="carousel-item">
            <img class="d-block w-100" src="${request.contextPath}../res/images/photo3.JPG" alt="Third slide">
        </div>
        <div class="carousel-item">
            <img class="d-block w-100" src="${request.contextPath}../res/images/photo4.JPG" alt="Fourth slide">
        </div>
        <div class="carousel-item">
            <img class="d-block w-100" src="${request.contextPath}../res/images/photo5.JPG" alt="Fifth slide">
        </div>
    </div>
    <a class="carousel-control-prev glow-link-white" href="#carouselHeader" role="button" data-slide="prev">
        <span class="carousel-control-prev-icon p-3" aria-hidden="true"></span>
        <span class="sr-only">Previous</span>
    </a>
    <a class="carousel-control-next glow-link-white" href="#carouselHeader" role="button" data-slide="next">
        <span class="carousel-control-next-icon p-3" aria-hidden="true"></span>
        <span class="sr-only">Next</span>
    </a>
</div>

<!-- MAIN CONTENT -->
<main class="container-fluid">
    <div class="row">

        <!-- LEFT COLUMN -->
        <div class="col-md-8 text-center" style="" id="col-lg">
            <div class="card">
                <img class="card-img" src="${request.contextPath}../res/images/halle.png">
            </div>
            <hr/>
            <a href="#">
                <div class="card glow-link-gold">
                    <div class="card-header">
                        <h4>
                            Click here to see highlights from Meet the Tigers Night!
                        </h4>
                    </div>
                    <img class="card-img" src="${request.contextPath}../res/images/meet-the-tigers.jpg" alt="Card image">
                </div>
            </a>
            <hr/>
            <div class="card">
                <div class="card-header">
                    <h4>2018 - 2019 Start & End Times</h4>
                </div>
                <img class="card-img" src="${request.contextPath}../res/images/start-end-times.jpg">
            </div>
            <hr/>
            <div class="card">
                <a href="#">
                    <img class="card-img glow-link-gold" src="${request.contextPath}../res/images/child-nutrition.png">
                </a>
            </div>
            <hr/>
            <div class="card glow-link-gold">
                <div class="card-header">
                    <a href="#"><h4>Click here for the 2018 - 2019 Pre-K through 6th grade school supply list.</h4></a>
                </div>
            </div>
            <hr/>
            <a href="#">
                <div class="card glow-link-gold">
                    <div class="card-header">
                        <h4 class="card-title m-auto my-auto">
                            Click here to download the 2018-2019 Corsicana ISD District calendar.
                        </h4>
                    </div>
                    <img class="card-img" src="${request.contextPath}../res/images/cisd-calendar.jpg" alt="Card image">
                </div>
            </a>
            <hr/>
            <div class="card">
                <div class="media p-3">
                    <img class="mr-3" src="${request.contextPath}../res/images/quick-tip.png" alt="Generic placeholder image">
                    <div class="media-body overflow-auto">
                        <h5 class="mt-0"><u>Quick Tip</u></h5>
                        Provide information quickly and anonymously through the online Corsicana ISD Quick Tip link.
                        Tips may be related to school safety, personal safety, bullying, vandalism, fighting, etc.
                        Tip providers may leave contact information if desired, or they may be submitted anonymously.
                        <a href="#">https://asp.schoolmessenger.com/corsicana/quicktip/</a>
                    </div>
                </div>
            </div>
            <hr/>
            <div class="card glow-link-gold">
                <div class="card-header">
                    <a href="#">
                        <h4>CISD NONDISCRIMINATION POLICY</h4>
                        <hr/>
                        <h4>AVISO DE NO DISCRIMINACIÓN</h4>
                    </a>
                </div>
            </div>
        </div>

        <!-- RIGHT COLUMN -->
        <div class="col-md-4 text-center" id="col-sm">
            <a href="#"><img class="rounded mx-auto d-block glow-link-white"
                             src="${request.contextPath}../res/images/quick-tip.png"></a>
            <hr/>
            <a href="#" class="text-white"><h2>Click here for the CISD Calendar</h2></a>
            <hr/>
            <a href="#"><img class="img-fluid mx-auto d-block glow-link-white"
                             src="${request.contextPath}../res/images/athletic-schedules.png"></a>
            <hr/>
            <button id="upcomingEventsButton" class="btn btn-primary d-none btn-collapse"
                    type="button" data-toggle="collapse" data-target="#upcomingEventsCollapse"
                    aria-expanded="false" aria-controls="upcomingEventsCollapse"></button>
            <div id="upcomingEventsCollapse" class="collapse"></div>
            <div id="upcomingEventsCard" class="card">
                <div id="upcomingEventsHeader" class="card-header">
                    <h2>Upcoming Events</h2>
                </div>
                <ul class="list-group list-group-flush list-unstyled">

                    <li>
                        <div class="card-header pb-0">
                            <h3>September</h3>
                        </div>
                    </li>

                    <li class="list-group-item">
                        <div class="card text-left">
                            <div class="media upcoming-events-media">
                                <div class="align-self-start pr-3">
                                    <h3 class="upcoming-events-date">03</h3>
                                </div>
                                <ul class="pl-0">
                                    <li class="media">
                                        <a href="#" class="text-white">
                                            <div class="media-body">
                                                <p class="mt-0 mb-0 text-light font-weight-light">ALL DAY</p>
                                                <h5 class="pb-0">School Holiday / Labor Day</h5>
                                            </div>
                                        </a>
                                    </li>
                                </ul>
                            </div>
                        </div>
                    </li>
                    <li class="list-group-item">
                        <div class="card text-left">
                            <div class="media upcoming-events-media">
                                <div class="align-self-start pr-3">
                                    <h3 class="upcoming-events-date">08</h3>
                                </div>
                                <ul class="pl-0">
                                    <li class="media">
                                        <a href="#" class="text-white">
                                            <div class="media-body">
                                                <p class="mt-0 mb-0 text-light font-weight-light">ALL DAY</p>
                                                <h5 class="pb-0">ACT Test</h5>
                                            </div>
                                        </a>
                                    </li>
                                </ul>
                            </div>
                        </div>
                    </li>
                    <li class="list-group-item">
                        <div class="card text-left">
                            <div class="media upcoming-events-media">
                                <div class="align-self-start pr-3">
                                    <h3 class="upcoming-events-date">10</h3>
                                </div>
                                <ul class="pl-0">
                                    <li class="media">
                                        <a href="#" class="text-white">
                                            <div class="media-body">
                                                <p class="mt-0 mb-0 text-light font-weight-light">ALL DAY</p>
                                                <h5 class="pb-0">SAT Prep Course Begins</h5>
                                            </div>
                                        </a>
                                    </li>
                                </ul>
                            </div>
                        </div>
                    </li>
                    <li class="list-group-item">
                        <div class="card text-left">
                            <div class="media upcoming-events-media">
                                <div class="align-self-start pr-3">
                                    <h3 class="upcoming-events-date">14</h3>
                                </div>
                                <ul class="pl-0">
                                    <li class="media">
                                        <a href="#" class="text-white">
                                            <div class="media-body">
                                                <p class="mt-0 mb-0 text-light font-weight-light">ALL DAY</p>
                                                <h5 class="pb-0">Corsicana Education Foundation Staff Drive Ends</h5>
                                            </div>
                                        </a>
                                    </li>
                                    <li class="media">
                                        <a href="#" class="text-white">
                                            <div class="media-body">
                                                <p class="mt-0 mb-0 text-light font-weight-light">4:00 PM - 5:00 PM</p>
                                                <h5 class="pb-0">Corsicana Education Foundation Fall Mini-Grants & Wish Lists Due</h5>
                                            </div>
                                        </a>
                                    </li>
                                    <li class="media">
                                        <a href="#" class="text-white">
                                            <div class="media-body">
                                                <p class="mt-0 mb-0 text-light font-weight-light">7:30 PM - 10:30 PM</p>
                                                <h5 class="pb-0">CHS Varsity Football vs. Greenville @ Tiger Stadium</h5>
                                            </div>
                                        </a>
                                    </li>
                                </ul>
                            </div>
                        </div>
                    </li>
                    <li class="list-group-item">
                        <div class="card text-left">
                            <div class="media upcoming-events-media">
                                <div class="align-self-start pr-3">
                                    <h3 class="upcoming-events-date">19</h3>
                                </div>
                                <ul class="pl-0">
                                    <li class="media">
                                        <a href="#" class="text-white">
                                            <div class="media-body">
                                                <p class="mt-0 mb-0 text-light font-weight-light">1:00 PM - 3:00 PM</p>
                                                <h5 class="pb-0">College Fair Day @ CHS Gym</h5>
                                            </div>
                                        </a>
                                    </li>
                                </ul>
                            </div>
                        </div>
                    </li>
                    <li class="list-group-item">
                        <div class="card text-left">
                            <div class="media upcoming-events-media">
                                <div class="align-self-start pr-3">
                                    <h3 class="upcoming-events-date">21</h3>
                                </div>
                                <ul class="pl-0">
                                    <li class="media">
                                        <a href="#" class="text-white">
                                            <div class="media-body">
                                                <p class="mt-0 mb-0 text-light font-weight-light">7:30 PM - 10:30 PM</p>
                                                <h5 class="pb-0">CHS Varsity Football @ Kaufman</h5>
                                            </div>
                                        </a>
                                    </li>
                                </ul>
                            </div>
                        </div>
                    </li>
                    <li class="list-group-item">
                        <div class="card text-left">
                            <div class="media upcoming-events-media">
                                <div class="align-self-start pr-3">
                                    <h3 class="upcoming-events-date">28</h3>
                                </div>
                                <ul class="pl-0">
                                    <li class="media">
                                        <a href="#" class="text-white">
                                            <div class="media-body">
                                                <p class="mt-0 mb-0 text-light font-weight-light">7:30 PM - 10:30 PM</p>
                                                <h5 class="pb-0">CHS Varsity Football vs. North Forney @ Tiger Stadium</h5>
                                            </div>
                                        </a>
                                    </li>
                                </ul>
                            </div>
                        </div>
                    </li>

                    <li>
                        <div class="card-header pb-0">
                            <h3>October</h3>
                        </div>
                    </li>

                    <li class="list-group-item">
                        <div class="card text-left">
                            <div class="media upcoming-events-media">
                                <div class="align-self-start pr-3">
                                    <h3 class="upcoming-events-date">05</h3>
                                </div>
                                <ul class="pl-0">
                                    <li class="media">
                                        <a href="#" class="text-white">
                                            <div class="media-body">
                                                <p class="mt-0 mb-0 text-light font-weight-light">7:30 PM - 10:30 PM</p>
                                                <h5 class="pb-0">CHS Varsity Football @ Terrell</h5>
                                            </div>
                                        </a>
                                    </li>
                                </ul>
                            </div>
                        </div>
                    </li>
                    <li class="list-group-item">
                        <div class="card text-left">
                            <div class="media upcoming-events-media">
                                <div class="align-self-start pr-3">
                                    <h3 class="upcoming-events-date">06</h3>
                                </div>
                                <ul class="pl-0">
                                    <li class="media">
                                        <a href="#" class="text-white">
                                            <div class="media-body">
                                                <p class="mt-0 mb-0 text-light font-weight-light">6:00 PM - 11:00 PM</p>
                                                <h5 class="pb-0">Corsicana Education Foundation 7th Annual C&B Seen Gala @ IOOF</h5>
                                            </div>
                                        </a>
                                    </li>
                                </ul>
                            </div>
                        </div>
                    </li>
                    <li class="list-group-item">
                        <div class="card text-left">
                            <div class="media upcoming-events-media">
                                <div class="align-self-start pr-3">
                                    <h3 class="upcoming-events-date">08</h3>
                                </div>
                                <ul class="pl-0">
                                    <li class="media">
                                        <a href="#" class="text-white">
                                            <div class="media-body">
                                                <p class="mt-0 mb-0 text-light font-weight-light">ALL DAY</p>
                                                <h5 class="pb-0">Student Holiday / Instructional Planning</h5>
                                            </div>
                                        </a>
                                    </li>
                                </ul>
                            </div>
                        </div>
                    </li>
                    <li class="list-group-item">
                        <div class="card text-left">
                            <div class="media upcoming-events-media">
                                <div class="align-self-start pr-3">
                                    <h3 class="upcoming-events-date">12</h3>
                                </div>
                                <ul class="pl-0">
                                    <li class="media">
                                        <a href="#" class="text-white">
                                            <div class="media-body">
                                                <p class="mt-0 mb-0 text-light font-weight-light">7:30 PM - 10:30 PM</p>
                                                <h5 class="pb-0">CHS Varsity Football vs. Royse City @ Tiger Stadium</h5>
                                            </div>
                                        </a>
                                    </li>
                                </ul>
                            </div>
                        </div>
                    </li>
                    <li class="list-group-item">
                        <div class="card text-left">
                            <div class="media upcoming-events-media">
                                <div class="align-self-start pr-3">
                                    <h3 class="upcoming-events-date">19</h3>
                                </div>
                                <ul class="pl-0">
                                    <li class="media">
                                        <a href="#" class="text-white">
                                            <div class="media-body">
                                                <p class="mt-0 mb-0 text-light font-weight-light">7:30 PM - 10:30 PM</p>
                                                <h5 class="pb-0">CHS Varsity Football @ Sulphur Springs</h5>
                                            </div>
                                        </a>
                                    </li>
                                </ul>
                            </div>
                        </div>
                    </li>
                    <li class="list-group-item">
                        <div class="card text-left">
                            <div class="media upcoming-events-media">
                                <div class="align-self-start pr-3">
                                    <h3 class="upcoming-events-date">22</h3>
                                </div>
                                <ul class="pl-0">
                                    <li class="media">
                                        <a href="#" class="text-white">
                                            <div class="media-body">
                                                <p class="mt-0 mb-0 text-light font-weight-light">ALL DAY</p>
                                                <h5 class="pb-0">Student Holiday / Professional Development</h5>
                                            </div>
                                        </a>
                                    </li>
                                </ul>
                            </div>
                        </div>
                    </li>
                    <li class="list-group-item">
                        <div class="card text-left">
                            <div class="media upcoming-events-media">
                                <div class="align-self-start pr-3">
                                    <h3 class="upcoming-events-date">23</h3>
                                </div>
                                <ul class="pl-0">
                                    <li class="media">
                                        <a href="#" class="text-white">
                                            <div class="media-body">
                                                <p class="mt-0 mb-0 text-light font-weight-light">ALL DAY</p>
                                                <h5 class="pb-0">Student Holiday / Parent Conferences</h5>
                                            </div>
                                        </a>
                                    </li>
                                </ul>
                            </div>
                        </div>
                    </li>
                    <li class="list-group-item">
                        <div class="card text-left">
                            <div class="media upcoming-events-media">
                                <div class="align-self-start pr-3">
                                    <h3 class="upcoming-events-date">26</h3>
                                </div>
                                <ul class="pl-0">
                                    <li class="media">
                                        <a href="#" class="text-white">
                                            <div class="media-body">
                                                <p class="mt-0 mb-0 text-light font-weight-light">7:30 PM - 10:30 PM</p>
                                                <h5 class="pb-0">CHS Varsity Football vs. Forney</h5>
                                            </div>
                                        </a>
                                    </li>
                                </ul>
                            </div>
                        </div>
                    </li>

                    <li>
                        <div class="card-header pb-0">
                            <h3>November</h3>
                        </div>
                    </li>

                    <li class="list-group-item">
                        <div class="card text-left">
                            <div class="media upcoming-events-media">
                                <div class="align-self-start pr-3">
                                    <h3 class="upcoming-events-date">16</h3>
                                </div>
                                <ul class="pl-0">
                                    <li class="media">
                                        <a href="#" class="text-white">
                                            <div class="media-body">
                                                <p class="mt-0 mb-0 text-light font-weight-light">ALL DAY</p>
                                                <h5 class="pb-0">Early Release All Campuses</h5>
                                            </div>
                                        </a>
                                    </li>
                                </ul>
                            </div>
                        </div>
                    </li>
                    <li class="list-group-item">
                        <div class="card text-left">
                            <div class="media upcoming-events-media">
                                <div class="align-self-start pr-3">
                                    <h3 class="upcoming-events-date">19</h3>
                                </div>
                                <ul class="pl-0">
                                    <li class="media">
                                        <a href="#" class="text-white">
                                            <div class="media-body">
                                                <p class="mt-0 mb-0 text-light font-weight-light">ALL DAY</p>
                                                <h5 class="pb-0">School Holiday / Thanksgiving</h5>
                                            </div>
                                        </a>
                                    </li>
                                </ul>
                            </div>
                        </div>
                    </li>
                    <li class="list-group-item">
                        <div class="card text-left">
                            <div class="media upcoming-events-media">
                                <div class="align-self-start pr-3">
                                    <h3 class="upcoming-events-date">20</h3>
                                </div>
                                <ul class="pl-0">
                                    <li class="media">
                                        <a href="#" class="text-white">
                                            <div class="media-body">
                                                <p class="mt-0 mb-0 text-light font-weight-light">ALL DAY</p>
                                                <h5 class="pb-0">School Holiday / Thanksgiving</h5>
                                            </div>
                                        </a>
                                    </li>
                                </ul>
                            </div>
                        </div>
                    </li>
                    <li class="list-group-item">
                        <div class="card text-left">
                            <div class="media upcoming-events-media">
                                <div class="align-self-start pr-3">
                                    <h3 class="upcoming-events-date">21</h3>
                                </div>
                                <ul class="pl-0">
                                    <li class="media">
                                        <a href="#" class="text-white">
                                            <div class="media-body">
                                                <p class="mt-0 mb-0 text-light font-weight-light">ALL DAY</p>
                                                <h5 class="pb-0">School Holiday / Thanksgiving</h5>
                                            </div>
                                        </a>
                                    </li>
                                </ul>
                            </div>
                        </div>
                    </li>
                    <li class="list-group-item">
                        <div class="card text-left">
                            <div class="media upcoming-events-media">
                                <div class="align-self-start pr-3">
                                    <h3 class="upcoming-events-date">22</h3>
                                </div>
                                <ul class="pl-0">
                                    <li class="media">
                                        <a href="#" class="text-white">
                                            <div class="media-body">
                                                <p class="mt-0 mb-0 text-light font-weight-light">ALL DAY</p>
                                                <h5 class="pb-0">School Holiday / Thanksgiving</h5>
                                            </div>
                                        </a>
                                    </li>
                                </ul>
                            </div>
                        </div>
                    </li>
                    <li class="list-group-item">
                        <div class="card text-left">
                            <div class="media upcoming-events-media">
                                <div class="align-self-start pr-3">
                                    <h3 class="upcoming-events-date">23</h3>
                                </div>
                                <ul class="pl-0">
                                    <li class="media">
                                        <a href="#" class="text-white">
                                            <div class="media-body">
                                                <p class="mt-0 mb-0 text-light font-weight-light">ALL DAY</p>
                                                <h5 class="pb-0">School Holiday / Thanksgiving</h5>
                                            </div>
                                        </a>
                                    </li>
                                </ul>
                            </div>
                        </div>
                    </li>

                    <li>
                        <div class="card-header pb-0">
                            <h3>December</h3>
                        </div>
                    </li>

                    <li class="list-group-item">
                        <div class="card text-left">
                            <div class="media upcoming-events-media">
                                <div class="align-self-start pr-3">
                                    <h3 class="upcoming-events-date">14</h3>
                                </div>
                                <ul class="pl-0">
                                    <li class="media">
                                        <a href="#" class="text-white">
                                            <div class="media-body">
                                                <p class="mt-0 mb-0 text-light font-weight-light">ALL DAY</p>
                                                <h5 class="pb-0">CEF Jean Day</h5>
                                            </div>
                                        </a>
                                    </li>
                                </ul>
                            </div>
                        </div>
                    </li>

                    <li class="list-group-item">
                        <div class="card text-left">
                            <div class="media upcoming-events-media">
                                <div class="align-self-start pr-3">
                                    <h3 class="upcoming-events-date">21</h3>
                                </div>
                                <ul class="pl-0">
                                    <li class="media">
                                        <a href="#" class="text-white">
                                            <div class="media-body">
                                                <p class="mt-0 mb-0 text-light font-weight-light">ALL DAY</p>
                                                <h5 class="pb-0">Early Release All Campuses</h5>
                                            </div>
                                        </a>
                                    </li>
                                </ul>
                            </div>
                        </div>
                    </li>

                    <li>
                        <div class="card-footer">
                            <a href="#" class="text-white"><h5 class="mb-0">View Full Calendar</h5></a>
                        </div>
                    </li>
                </ul>
            </div>
        </div>
    </div>
</main>
