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
                        <h5 class="card-title align-middle d-inline-block">
                            <u>Click here to see highlights from Meet the Tigers Night!</u>
                        </h5>
                    </div>
                </div>
            </a>
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
                <ul class="list-group list-group-flush">
                    <div class="card-header text-left pb-0">
                        <h4>September</h4>
                    </div>
                    <li class="list-group-item">
                        <div class="card text-left">
                            <div class="media upcoming-events-media">
                                <div class="align-self-start pr-3">
                                    <h3 class="upcoming-events-date">03</h3>
                                </div>
                                <a href="#" class="text-white">
                                    <div class="media-body">
                                        <p class="mt-0 mb-0 text-light font-weight-light">All Day</p>
                                        <h5 class="pb-0">School Holiday / Labor Day</h5>
                                    </div>
                                </a>
                            </div>
                        </div>
                    </li>
                    <li class="list-group-item">
                        <div class="card text-left">
                            <div class="media upcoming-events-media">
                                <div class="align-self-start pr-3">
                                    <h3 class="upcoming-events-date">08</h3>
                                </div>
                                <a href="#" class="text-white">
                                    <div class="media-body">
                                        <p class="mt-0 mb-0 text-light font-weight-light">All Day</p>
                                        <h5 class="pb-0">ACT Test</h5>
                                    </div>
                                </a>
                            </div>
                        </div>
                    </li>
                    <li class="list-group-item">
                        <div class="card text-left">
                            <div class="media upcoming-events-media">
                                <div class="align-self-start pr-3">
                                    <h3 class="upcoming-events-date">10</h3>
                                </div>
                                <a href="#" class="text-white">
                                    <div class="media-body">
                                        <p class="mt-0 mb-0 text-light font-weight-light">All Day</p>
                                        <h5 class="pb-0">SAT Prep Course Begins</h5>
                                    </div>
                                </a>
                            </div>
                        </div>
                    </li>
                    <div class="card-footer">
                        <a href="#" class="text-white"><h4>View Full Calendar</h4></a>
                    </div>
                </ul>
            </div>
        </div>
    </div>
</div>