<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<!doctype html>

<html lang="en">
<head>
    <!-- Required meta tags for Bootstrap -->
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">

    <link rel="stylesheet" href="res/css/animate.css-3.7.0/animate.css">
    <link rel="stylesheet" href="res/css/fonts.css">
    <link rel="stylesheet" href="res/css/bootstrap-4.0.0.min.css">
    <link rel="stylesheet" href="res/css/styles.css">
    <link rel="icon" type="image/png" href="res/images/cisd-logo.png">
    <title>Corsicana ISD</title>
</head>

<body>
<!-- TOP NAV -->
<nav class="navbar navbar-expand-md navbar-dark bg-dark justify-content-between pb-0" id="nav1">
    <a class="navbar-brand" href="#" id="main-logo">
        <img src="res/images/cisd-logo.png">
    </a>
    <button id="navbar-toggle" class="navbar-toggler" type="button">
        <span class="navbar-toggler-icon"></span>
    </button>

    <div class="collapse navbar-collapse justify-content-end" id="navbar1">
        <ul id="nav1-links" class="nav justify-content-end">
            <li class="nav-item">
                <a class="nav-link" href="${request.contextPath}/">District Home</a>
            </li>
            <li class="nav-item dropdown">
                <a class="nav-link dropdown-toggle" href="#" id="schoolsDropdown"
                   role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">Schools</a>
                <div class="dropdown-menu" aria-labelledby="schoolsDropdown">
                    <a class="dropdown-item" href="#">Bowie Elementary</a>
                    <a class="dropdown-item" href="#">Carroll Elementary</a>
                    <a class="dropdown-item" href="#">Fannin Elementary</a>
                    <a class="dropdown-item" href="#">Navarro Elementary</a>
                    <a class="dropdown-item" href="#">Sam Houston Elementary</a>
                    <a class="dropdown-item" href="#">Collins Intermediate</a>
                    <a class="dropdown-item" href="#">Corsicana Middle</a>
                    <a class="dropdown-item" href="#">Corsicana High</a>
                    <a class="dropdown-item" href="#">Athletics</a>
                </div>
            </li>
            <li class="nav-item">
                <a class="nav-link" href="#">Translate</a>
            </li>
            <li class="nav-item">
                <a class="nav-link" href="#">Admin Login</a>
            </li>
        </ul>

        <form id="search-bar" class="form-inline my-2 my-lg-0 align-content-center">
            <input id="search-input" class="form-control mr-sm-2"
                   type="search" placeholder="Search" aria-label="Search">
            <button class="btn btn-outline-warning my-2 my-sm-0" type="submit">Search</button>
        </form>

    </div>
</nav>

<!-- BRAND NAME -->
<div id="brand-bar" class="navbar navbar-dark bg-dark justify-content-start pt-0">
    <div id="brand-bar-inner" class="navbar navbar-dark bg-dark justify-content-start pt-0 brand-bar-inner">
        <h2 id="brand-name-top" class="brand-name">CORSICANA ISD</h2>
        <p id="brand-hashtag-top" class="d-inline-block brand-hashtag">#TCC</p>
    </div>
</div>

<!-- DYNAMIC NAV -->
<nav class="navbar navbar-expand-md justify-content-start pb-0 pt-0" id="nav2">
    <div class="navbar pt-0 pb-0 pl-3" id="navbar2">
        <ul id="nav2-links" class="nav"></ul>
    </div>
</nav>

<!-- SIDE NAV -->
<nav id="side-nav" class="nav flex-column bg-dark d-none">
    <hr/>
    <div class="nav-item dropdown">
        <a class="nav-link dropdown-toggle" href="#" id="global-btn-dropdown"
           role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">Global Links</a>
        <div id="global-link-dropdown" class="dropdown-menu" aria-labelledby="global-btn-dropdown"></div>
    </div>
</nav>

<!-- PAGE CONTENT -->
<c:import url="${campus}/${page}.jsp" />

<!-- GLOBAL LINKS -->
<div class="container-fluid text-center" id="global-link-container">
    <div class="btn-group col-md-9 justify-content-center" id="global-link-group">
        <a class="btn btn-warning glow-link-gold col-md-2"
           target="_blank" href="https://login.microsoftonline.com/">Email</a>
        <a class="btn btn-warning glow-link-gold col-md-2"
           target="_blank" href="https://txsuite12.txeis.net/tc175903/Login.aspx">Grades</a>
        <a class="btn btn-warning glow-link-gold col-md-2"
           target="_blank" href="https://corsicanaisd.tedk12.com/hire/index.aspx">Jobs</a>
        <a class="btn btn-warning glow-link-gold col-md-2">Menus</a>
        <a class="btn btn-warning glow-link-gold col-md-2"
           target="_blank" href="https://corsicana-my.sharepoint.com/">One Drive</a>
        <a class="btn btn-warning glow-link-gold col-md-2">E-News</a>
    </div>
</div>

<!-- FOOTER -->
<footer class="footer">
    <div class="container-fluid">
        <div class="row w-75 m-auto p-4">
            <div class="col-md-6">
                    <h2 class="brand-name mb-0">CORSICANA ISD</h2>
                    <h6 class="brand-hashtag ml-0 mb-1">#TCC</h6>
                    <h6>Address: 2200 W. 4th Ave. Corsicana, TX 75110</h6>
                    <h6>Phone: (903) 874-7441</h6>
                    <h6>Fax: (903) 874-2454</h6>
            </div>
            <div class="col-md-6 text-center">
                <a href="https://twitter.com/CorsicanaISD" style="text-decoration: none;">
                    <div class="social-link d-inline-flex ml-1 mr-1">
                        <img class="my-auto" src="${request.contextPath}/res/images/twitter.png">
                    </div>
                </a>
                <a href="https://www.flickr.com/photos/cisd/albums" style="text-decoration: none;">
                    <div class="social-link d-inline-flex ml-1 mr-1">
                        <img class="my-auto" src="${request.contextPath}/res/images/flickr.png">
                    </div>
                </a>
                <a href="https://www.facebook.com/CISDTigers/" style="text-decoration: none;">
                    <div class="social-link d-inline-flex ml-1 mr-1">
                        <img class="my-auto" src="${request.contextPath}/res/images/facebook.png">
                    </div>
                </a>
                <a href="https://www.youtube.com/channel/UCuCKS5YE0yEaXXZFl7_H4iA" style="text-decoration: none;">
                    <div class="social-link d-inline-flex ml-1 mr-1">
                        <img class="my-auto" src="${request.contextPath}/res/images/youtube.png">
                    </div>
                </a>
                <br>
                <a href="#">Site Map</a>
            </div>
        </div>
    </div>
    <button type="button" id="scroll-top-btn" class="btn-block d-flex">
        <img class="m-auto my-auto" src="${request.contextPath}/res/images/up.png">
    </button>
</footer>

<!-- SCRIPTS -->
    <!-- Required script tags for Bootstrap -->
    <script src="${request.contextPath}/res/js/jquery-3.3.1.min.js"></script>
    <script src="${request.contextPath}/res/js/popper-1.12.9.min.js"></script>
    <script src="${request.contextPath}/res/js/bootstrap-4.0.0.min.js"></script>

    <script src="${request.contextPath}/res/js/${campus}/${page}.js"></script>
    <script src="${request.contextPath}/res/js/index.js"></script>
</body>

</html>