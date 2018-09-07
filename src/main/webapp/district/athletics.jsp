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
        <div class="col-md-8 text-center" style="" id="home-col-left">
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
        <div class="col-md-4 text-center" id="home-col-right">

        </div>
    </div>
</main>