<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>

<!-- DYNAMIC NAV -->
<nav class="navbar navbar-expand-md justify-content-start pb-0 pt-0" id="nav2">
    <div class="navbar pt-0 pb-0 pl-3" id="navbar2">
        <ul id="nav2-links" class="nav">
            <li class="nav-item active">
                <a class="nav-link" href="${request.contextPath}/athletics">HOME</a>
            </li>
            <li class="nav-item dropdown">
                <a class="nav-link" href="#" id="aboutDropdown"
                   role="button" aria-haspopup="true" aria-expanded="false">ABOUT US</a>
                <div class="dropdown-menu" aria-labelledby="aboutDropdown">
                    <a class="dropdown-item" href="${request.contextPath}/athletics/about">Athletic Administration</a>
                    <a class="dropdown-item" href="#">Sports Medicine - Athletic Training Information</a>
                    <a class="dropdown-item" href="#">Advertising at Tiger Stadium</a>
                    <a class="dropdown-item" href="#">Meet the CHS Coaches</a>
                    <a class="dropdown-item" href="#">Meet the CMS Coaches</a>
                </div>
            </li>
            <li class="nav-item dropdown">
                <a class="nav-link" href="#" id="boosterClubDropdown"
                   role="button" aria-haspopup="true" aria-expanded="false">BOOSTER CLUB</a>
                <div class="dropdown-menu" aria-labelledby="boosterClubDropdown">
                    <a class="dropdown-item" href="#">Booster Club</a>
                    <a class="dropdown-item" href="#">UIL Booster Club Guidelines</a>
                </div>
            </li>
            <li class="nav-item">
                <a class="nav-link" href="${request.contextPath}/athletics/facilities">FACILITIES</a>
            </li>
            <li class="nav-item">
                <a class="nav-link" href="#">FORMS</a>
            </li>
            <li class="nav-item">
                <a class="nav-link" href="${request.contextPath}/athletics/schedules">SCHEDULES</a>
            </li>
            <li class="nav-item">
                <a class="nav-link" href="${request.contextPath}/athletics/sports">SPORTS</a>
            </li>
            <li class="nav-item">
                <a class="nav-link" href="${request.contextPath}/athletics/calendar">CALENDAR</a>
            </li>
        </ul>
    </div>
</nav>

<!-- MAIN CONTENT -->
<main class="container-fluid">
    <div class="row">

        <!-- LEFT COLUMN -->
        <div class="col-md-3 text-center" id="col-sm">

        </div>

        <!-- RIGHT COLUMN -->
        <div class="col-md-9 text-center" style="" id="col-lg">
            <div class="noprint breadcrumb-container true"><ul class="ui-breadcrumbs" role="navigation" aria-label="Breadcrumbs">
                <li class="ui-breadcrumb-first"><a href="#"><span>Home</span></a></li>

                <li data-bccid="6"><a href="#"><span>About Us</span></a></li>

                <li class="ui-breadcrumb-last" data-bcsid="36"><a href="#"><span>Mission &amp; Core Values</span></a></li>

                <li class="ui-breadcrumb-last"><span>Home</span></li>

            </ul>
            </div>
        </div>
    </div>
</main>