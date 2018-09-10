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
                <h5 id="A">A</h5>
                <ul>
                    <li><a href="#">Administration</a></li>
                </ul>
            </li>
            <li>
                <h5 id="B">B</h5>
                <ul>
                    <li><a href="#">Business Services</a></li>
                </ul>
            </li>
            <li>
                <h5 id="C">C</h5>
                <ul>
                    <li><a href="#">Child Nutrition Services</a></li>
                    <li><a href="#">Communications</a></li>
                    <li><a href="#">Curriculum</a></li>
                </ul>
            </li>
            <li>
                <h5 id="E">E</h5>
                <ul>
                    <li><a href="#">Extracurricular Activities</a></li>
                </ul>
            </li>
            <li>
                <h5 id="H">H</h5>
                <ul>
                    <li><a href="#">Health Services</a></li>
                    <li><a href="#">Human Resources</a></li>
                </ul>
            </li>
            <li>
                <h5 id="M">M</h5>
                <ul>
                    <li><a href="#">Maintenance &amp; Operations</a></li>
                </ul>
            </li>
            <li>
                <h5 id="P">P</h5>
                <ul>
                    <li><a href="#">Police Department</a></li>
                </ul>
            </li>
            <li>
                <h5 id="S">S</h5>
                <ul>
                    <li><a href="#">Special Programs</a></li>
                </ul>
            </li>
            <li>
                <h5 id="T">T</h5>
                <ul>
                    <li><a href="#">Technology</a></li>
                    <li><a href="#">Transportation</a></li>
                </ul>
            </li>
        </ul>
    </div>
</main>