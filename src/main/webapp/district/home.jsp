<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>

<div id="carouselExampleControls" class="carousel slide" data-ride="carousel">
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
    <a class="carousel-control-prev" href="#carouselExampleControls" role="button" data-slide="prev">
        <span class="carousel-control-prev-icon" aria-hidden="true"></span>
        <span class="sr-only">Previous</span>
    </a>
    <a class="carousel-control-next" href="#carouselExampleControls" role="button" data-slide="next">
        <span class="carousel-control-next-icon" aria-hidden="true"></span>
        <span class="sr-only">Next</span>
    </a>
    <div class="container-fluid" id="global-btns">
        <div class="row">
            <div class="col-2 text-center">
                <a class="btn btn-warning">Email</a>
            </div>
            <div class="col-2 text-center">
                <a class="btn btn-warning">Grade</a>
            </div>
            <div class="col-2 text-center">
                <a class="btn btn-warning">Jobs</a>
            </div>
            <div class="col-2 text-center">
                <a class="btn btn-warning">Menus</a>
            </div>
            <div class="col-2 text-center">
                <a class="btn btn-warning">One Drive</a>
            </div>
            <div class="col-2 text-center">
                <a class="btn btn-warning">E-News</a>
            </div>
        </div>
    </div>
</div>

<div class="container-fluid">
    <div class="row">
        <div class="col-md-8 text-center" style="" id="home-col-left">
            <div class="card">
                <img class="card-img" src="${request.contextPath}../res/images/halle.png">
            </div>
            <hr/>
            <a href="#">
                <div class="card bg-dark text-white">
                    <img class="card-img" src="${request.contextPath}../res/images/meet-the-tigers.jpg" alt="Card image">
                    <div class="card-img-overlay overlay-center">
                        <h4 class="card-title align-middle d-inline-block">
                            <u>Click here to see highlights from Meet the Tigers Night!</u>
                        </h4>
                    </div>
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
                    <img class="card-img img-link" src="${request.contextPath}../res/images/child-nutrition.png">
                </a>
            </div>
            <hr/>
            <div class="card">
                <div class="card-header">
                    <a href="#"><h4>Click here for the 2018 - 2019 Pre-K through 6th grade school supply list.</h4></a>
                </div>
            </div>
        </div>

        <div class="col-md-4 text-center" id="home-col-right">
            <a href="#"><img class="rounded mx-auto d-block img-link" src="${request.contextPath}../res/images/quick-tip.png"></a>
            <hr/>
            <a href="#" class="text-white"><h2>Click here for the CISD Calendar</h2></a>
            <hr/>
            <a href="#"><img class="img-fluid mx-auto d-block img-link" src="${request.contextPath}../res/images/athletic-schedules.png"></a>
            <hr/>
            <div class="card">
                <div class="card-header">
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
</div>