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

<!-- DIRECTORY LISTING -->
<main id="directory-container" class="container directory-container">
    <div id="directory-btn-group" class="btn-group"></div>
    <h3 id="directory-header">About Us Directory</h3>
    <div id="directory-columns" class="container">
        <ul>
            <li>
                <h5 id="2">2</h5>
                <ul>
                    <li><a href="#">2014 Bond</a></li>
                </ul>
            </li>
            <li>
                <h5 id="A">A</h5>
                <ul>
                    <li><a href="#">Awards, Ratings &amp; Scores</a></li>
                </ul>
            </li>
            <li>
                <h5 id="B">B</h5>
                <ul>
                    <li><a href="#">Board of Trustees</a></li>
                    <li><a href="#">Board Policies</a></li>
                </ul>
            </li>
            <li>
                <h5 id="C">C</h5>
                <ul>
                    <li><a href="#">Campus Directory</a></li>
                    <li><a href="#">CISD Quick Facts</a></li>
                </ul>
            </li>
            <li>
                <h5 id="D">D</h5>
                <ul>
                    <li><a href="#">District &amp; Campus Improvement Plans</a></li>
                </ul>
                <ul>
                    <li><a href="#">District Information</a></li>
                    <li><a href="#">District Map</a></li>
                    <li><a href="#">District of Innovation Plan</a></li>
                </ul>
            </li>
            <li>
                <h5 id="E">E</h5>
                <ul>
                    <li><a href="#">Education Foundation</a></li>
                </ul>
            </li>
            <li>
                <h5 id="F">F</h5>
                <ul>
                    <li><a href="#">Financial Transparency</a></li>
                </ul>
            </li>
            <li>
                <h5 id="H">H</h5>
                <ul>
                    <li><a href="#">House Bill 5 Community &amp; Student Engagement Ratings &amp; Compliance</a></li>
                </ul>
            </li>
            <li>
                <h5 id="L">L</h5>
                <ul>
                    <li><a href="#">Legal Postings</a></li>
                </ul>
            </li>
            <li>
                <h5 id="M">M</h5>
                <ul>
                    <li><a href="#">Mission &amp; Core Values</a></li>
                </ul>
            </li>
            <li>
                <h5 id="N">N</h5>
                <ul>
                    <li><a href="#">News</a></li>
                </ul>
            </li>
            <li>
                <h5 id="R">R</h5>
                <ul>
                    <li><a href="#">Required Postings</a></li>
                </ul>
            </li>
            <li>
                <h5 id="S">S</h5>
                <ul>
                    <li><a href="#">Superintendent's C Award</a></li>
                </ul>
            </li>
            <li>
                <h5 id="V">V</h5>
                <ul>
                    <li><a href="#">Vision 2020</a></li>
                </ul>
            </li>
        </ul>
    </div>
</main>
