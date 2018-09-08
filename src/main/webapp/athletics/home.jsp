<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>

<!-- PHOTO CAROUSEL -->
<div id="carouselHeader" class="carousel slide" data-ride="carousel">
    <div class="carousel-inner">
        <div class="carousel-item active">
            <img class="d-block w-100" src="${request.contextPath}../res/images/athletics1.JPG" alt="First slide">
        </div>
        <div class="carousel-item">
            <img class="d-block w-100" src="${request.contextPath}../res/images/athletics2.jpg" alt="Second slide">
        </div>
        <div class="carousel-item">
            <img class="d-block w-100" src="${request.contextPath}../res/images/athletics3.jpg" alt="Third slide">
        </div>
        <div class="carousel-item">
            <img class="d-block w-100" src="${request.contextPath}../res/images/athletics4.JPG" alt="Fourth slide">
        </div>
        <div class="carousel-item">
            <img class="d-block w-100" src="${request.contextPath}../res/images/athletics5.JPG" alt="Fifth slide">
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
        <div class="col-md-8 text-center" style="" id="col-left">
            <div class="card">
                <div class="card-header">
                    <h4>Cross Country Parent Meeting</h4>
                </div>
                <div class="card-body">
                    <p>August 30th @ 6:00 pm</p>
                    <p>Corsicana High School Library</p>
                </div>
            </div>
        </div>

        <!-- RIGHT COLUMN -->
        <div class="col-md-4 text-center" id="col-right">
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
                                    <h3 class="upcoming-events-date">10</h3>
                                </div>
                                <ul class="pl-0">
                                    <li class="media">
                                        <a href="#" class="text-white">
                                            <div class="media-body">
                                                <p class="mt-0 mb-0 text-light font-weight-light">5:00 PM - 7:00 PM</p>
                                                <h5 class="pb-0">7th Grade Football @ Red Oak Junior High Scrimmage</h5>
                                            </div>
                                        </a>
                                    </li>
                                    <li class="media">
                                        <a href="#" class="text-white">
                                            <div class="media-body">
                                                <p class="mt-0 mb-0 text-light font-weight-light">6:00 PM - 7:00 PM</p>
                                                <h5 class="pb-0">CHS Booster Club Meeting @ Tiger Stadium Community Room</h5>
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
                </ul>
            </div>
        </div>
    </div>
</main>