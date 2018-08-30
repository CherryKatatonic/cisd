<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<!doctype html>

<html lang="en">
<head>
    <!-- Required meta tags for Bootstrap -->
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">

    <link rel="stylesheet" href="res/css/animate.css-3.7.0/animate.css">
    <link href="https://fonts.googleapis.com/css?family=Khula|Titillium+Web:200,400" rel="stylesheet">
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
                <a class="nav-link" href="#">District Home</a>
            </li>
            <li class="nav-item dropdown">
                <a class="nav-link dropdown-toggle" href="#" id="schoolsDropdown" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                    Schools
                </a>
                <div class="dropdown-menu" aria-labelledby="schoolsDropdown">
                    <a class="dropdown-item" href="#">BOWIE ELEMENTARY</a>
                    <a class="dropdown-item" href="#">CARROLL ELEMENTARY</a>
                    <a class="dropdown-item" href="#">FANNIN ELEMENTARY</a>
                    <a class="dropdown-item" href="#">NAVARRA ELEMENTARY</a>
                    <a class="dropdown-item" href="#">SAM HOUSTON ELEMENTARY</a>
                    <a class="dropdown-item" href="#">COLLINS INTERMEDIATE</a>
                    <a class="dropdown-item" href="#">CORSICANA MIDDLE</a>
                    <a class="dropdown-item" href="#">CORSICANA HIGH</a>
                    <a class="dropdown-item" href="#">ATHLETICS</a>
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
            <input id="search-input" class="form-control mr-sm-2" type="search" placeholder="Search" aria-label="Search">
            <button class="btn btn-outline-warning my-2 my-sm-0" type="submit">Search</button>
        </form>

    </div>
</nav>

<!-- BRAND NAME -->
<div id="brand-bar" class="navbar navbar-dark bg-dark justify-content-start pt-0">
    <div id="brand-bar-inner" class="navbar navbar-dark bg-dark justify-content-start pt-0">
        <h2 id="brand-name">CORSICANA ISD</h2>
        <p class="d-inline-block" id="brand-hashtag">#TCC</p>
    </div>
</div>

<!-- TRANSPARENT NAV -->
<nav class="navbar navbar-expand-md navbar-dark justify-content-start pb-0 pt-0" id="nav2">
    <div class="navbar" id="navbar2">
        <ul id="nav2-links" class="nav">
            <li class="nav-item active">
                <a class="nav-link" href="#">HOME</a>
            </li>
            <li class="nav-item">
                <a class="nav-link" href="#">ABOUT US</a>
            </li>
            <li class="nav-item">
                <a class="nav-link" href="#">ATHLETICS</a>
            </li>
            <li class="nav-item">
                <a class="nav-link" href="#">DEPARTMENTS</a>
            </li>
            <li class="nav-item">
                <a class="nav-link" href="#">PARENTS & COMMUNITY</a>
            </li>
            <li class="nav-item">
                <a class="nav-link" href="#">STAFF</a>
            </li>
            <li class="nav-item">
                <a class="nav-link" href="#">CALENDAR</a>
            </li>
        </ul>
    </div>
</nav>

<!-- MOBILE/RESPONSIVE NAV -->
<nav id="side-nav" class="nav flex-column bg-dark d-none">
    <hr/>
</nav>

<!-- PAGE CONTENT -->
<c:import url="${campus}/${page}.jsp" />

<!-- SCRIPTS -->
    <!-- Required script tags for Bootstrap -->
    <script src="${request.contextPath}/res/js/jquery-3.3.1.min.js"></script>
    <script src="${request.contextPath}/res/js/popper-1.12.9.min.js"></script>
    <script src="${request.contextPath}/res/js/bootstrap-4.0.0.min.js"></script>

    <script>
        $(document).ready(function() {
            if (window.innerWidth < 768) {
                hideNavs();
            } else {
                showNavs();
            }
        });

        $(window).resize(function() {
            if (window.innerWidth < 768) {
                hideNavs();
            } else {
                showNavs();
            }
        });

        function hideNavs() {
            $('#brand-bar-inner').prependTo($('#nav1'));
            $('#nav2-links').prependTo($('#side-nav'));
            $('#search-bar').prependTo($('#side-nav'));
            $('#nav1-links').appendTo($('#side-nav'));
            $('.nav-item').addClass('w-100');
            //$('#nav2').removeClass('pt-1 pb-1').addClass('p-0');
            $('#navbar2').hide();
        }

        function showNavs() {
            $('#brand-bar-inner').appendTo($('#brand-bar'));
            $('#nav2-links').appendTo($('#nav2'));
            $('#nav1-links').appendTo($('#nav1'));
            $('#search-bar').appendTo($('#nav1'));
            $('.nav-item').removeClass('w-100');
            //$('#nav2').addClass('pt-1 pb-1').removeClass('p-0');
            $('#navbar2').show();
        }

        $('#navbar-toggle').click(function() {
           $('#side-nav').toggleClass('d-none');
        });
    </script>

</body>

</html>