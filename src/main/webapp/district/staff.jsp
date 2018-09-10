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
    <h3 id="directory-header">Departments Directory</h3>
    <div id="directory-columns" class="container">
        <ul>
            <li>
                <h5 id="2">2</h5>
                <ul>
                    <li><a href="#">2018-2019 Payroll Dates</a></li>
                    <li><a href="#">2018-2019 Staff Calendar</a></li>
                </ul>
            </li>
            <li>
                <h5 id="C">C</h5>
                <ul>
                    <li><a href="#">CISD Event Planning Assistance</a></li>
                </ul>
            </li>
            <li>
                <h5 id="D">D</h5>
                <ul>
                    <li><a href="#">District Calendar &amp; Map</a></li>
                </ul>
            </li>
            <li>
                <h5 id="E">E</h5>
                <ul>
                    <li><a href="#">Employee Handbook</a></li>
                </ul>

            </li>
            <li>
                <h5 id="S">S</h5>
                <ul>
                    <li><a href="#">Scheduling Field Trip/Transportation</a></li>
                    <li><a href="#">Staff Development</a></li>
                    <li><a href="#">Staff Forms</a></li>
                    <li><a href="#">Staff Resources</a></li>
                </ul>
            </li>
            <li>
                <h5 id="T">T</h5>
                <ul>
                    <li><a href="#">Teacher Web Page Training</a></li>
                </ul>
            </li>
        </ul>
    </div>
</main>