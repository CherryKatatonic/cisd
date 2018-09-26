<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<!doctype html>

<html lang="en">
<head>
    <!-- Required meta tags for Bootstrap -->
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">

    <link rel="stylesheet" href="${request.contextPath}/res/css/fonts.css">
    <link rel="stylesheet" href="${request.contextPath}/res/css/lib/jquery-ui.min.css">
    <link rel="stylesheet" href="${request.contextPath}/res/css/lib/bootstrap-4.0.0.min.css">
    <link rel="stylesheet" href="${request.contextPath}/res/css/styles.css">
    <link rel="icon" type="image/png" href="${request.contextPath}/res/images/cisd-logo.png">
    <title>Corsicana ISD</title>
</head>

<body>
<!-- TOP NAV -->
<nav class="navbar navbar-expand-md navbar-dark bg-dark justify-content-between pb-0" id="nav1">
    <a class="navbar-brand" href="#" id="main-logo">
        <img src="${request.contextPath}/res/images/cisd-logo.png">
    </a>
    <button id="navbar-toggle" class="navbar-toggler" type="button">
        <span class="navbar-toggler-icon"></span>
    </button>

    <div class="collapse navbar-collapse justify-content-end" id="navbar1">
        <ul id="nav1-links" class="nav justify-content-end">
            <li class="nav-item">
                <a class="nav-link" href="${request.contextPath}/">District Home</a>
            </li>

            <!-- SCHOOLS DROPDOWN -->
            <li class="nav-item dropdown">
                <a class="nav-link dropdown-toggle" href="#" id="schoolsDropdown" role="button"
                   data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">Schools</a>
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

            <!-- LOGIN DROPDOWN -->
            <li class="nav-item dropdown">
                <a class="nav-link dropdown-toggle" href="#" id="loginDropdown" role="button"
                   data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">Admin Login</a>
                <div id="loginDropdownMenu" class="dropdown-menu" aria-labelledby="loginDropdown">

                    <div class="tab-content" id="loginTabContent">

                        <!-- LOGIN FORM -->
                        <div class="tab-pane fade show active" id="loginForm" role="tabpanel" aria-labelledby="loginTab">
                            <form action="${request.contextPath}/login" method="post" class="px-4 py-3">
                                <h5 class="text-center">Admin Login</h5>
                                <label for="loginForm">${loginMessage}</label>
                                <label for="loginForm">${loginError}</label>
                                <c:remove var="loginMessage" scope="session"/>
                                <c:remove var="loginError" scope="session"/>
                                <div class="form-group">
                                    <label for="loginEmail">Email</label>
                                    <input type="email" class="form-control" id="loginEmail"
                                           name="email" placeholder="example@cisd.org" value="${loginEmail}">
                                    <c:remove var="loginEmail" scope="session"/>
                                </div>
                                <div class="form-group">
                                    <label for="loginPassword">Password</label>
                                    <input type="password" class="form-control" id="loginPassword"
                                           name="password" placeholder="Password">
                                </div>
                                <div class="col-12 text-center mt-3">
                                    <button id="loginSubmit" type="submit" class="btn btn-outline-warning px-4">Sign in</button>
                                </div>
                            </form>
                        </div>

                        <!-- SIGNUP FORM -->
                        <div class="tab-pane fade" id="signupForm" role="tabpanel" aria-labelledby="signupTab">
                            <form action="${request.contextPath}/signup" method="post" class="px-4 py-3">
                                <h5 class="text-center">New Admin</h5>
                                <label for="signupForm">${signupMessage}</label>
                                <label for="signupForm">${signupError}</label>
                                <c:remove var="signupMessage" scope="session"/>
                                <c:remove var="signupError" scope="session"/>
                                <div class="form-group">
                                    <label for="signupEmail">Email</label>
                                    <input type="email" class="form-control" id="signupEmail"
                                           name="email" placeholder="example@cisd.org" value="${signupEmail}">

                                    <c:remove var="signupEmail" scope="session"/>
                                </div>
                                <div class="form-group">
                                    <label for="signupPassword">Admin Password</label>
                                    <input type="password" class="form-control" id="signupPassword"
                                           name="password" placeholder="Admin Password">
                                </div>
                                <div class="col-12 text-center mt-3">
                                    <button id="signupSubmit" type="submit" class="btn btn-outline-warning px-4">Submit</button>
                                </div>
                            </form>
                        </div>

                        <div class="tab-pane fade" id="passwordForm" role="tabpanel" aria-labelledby="passwordTab">
                            <form action="${request.contextPath}/reset-password" method="post" class="px-4 py-3">
                                <h5 class="text-center">Reset Password</h5>
                                <label for="passwordForm">${passwordMessage}</label>
                                <label for="passwordForm">${passwordError}</label>
                                <c:remove var="passwordMessage" scope="session"/>
                                <c:remove var="passwordError" scope="session"/>
                                <div class="form-group">
                                    <label for="passwordEmail">Email</label>
                                    <input type="email" class="form-control" id="passwordEmail"
                                           name="email" placeholder="example@cisd.org" value="${passwordEmail}">
                                    <c:remove var="passwordEmail" scope="session"/>
                                </div>
                                <div class="form-group">
                                    <label for="passwordPassword">Admin Password</label>
                                    <input type="password" class="form-control" id="passwordPassword"
                                           name="password" placeholder="Admin Password">
                                </div>
                                <div class="col-12 text-center mt-3">
                                    <button id="passwordSubmit" type="submit" class="btn btn-outline-warning px-4">Submit</button>
                                </div>
                            </form>
                        </div>
                    </div>
                    <!-- Password form had to be moved outside of the tabcontent div because it
                     suddenly started putting itself inside of the signup form for some unknown reason.
                     If it ever starts acting normal again, put it back in the tabconent div. -->
                    <!-- PASSWORD FORM -->

                    <div class="dropdown-divider"></div>
                    <div class="nav flex-column nav-pills" id="loginTablist" role="tablist" aria-orientation="vertical">
                        <a class="nav-link active" id="loginTab" data-toggle="pill" href="#loginForm"
                           role="tab" aria-controls="loginForm" aria-selected="true">Admin Login</a>
                        <a class="nav-link" id="signupTab" data-toggle="pill" href="#signupForm"
                           role="tab" aria-controls="signupForm" aria-selected="false">New Admin</a>
                        <a class="nav-link" id="passwordTab" data-toggle="pill" href="#passwordForm"
                           role="tab" aria-controls="passwordForm" aria-selected="false">Reset Password</a>
                    </div>
                </div>
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
<c:import url="${request.contextPath}/${campus}/${page}.jsp" />

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
    <script src="${request.contextPath}/res/js/lib/jquery-3.3.1.min.js"></script>
    <script src="${request.contextPath}/res/js/lib/popper-1.12.9.min.js"></script>
    <script src="${request.contextPath}/res/js/lib/bootstrap-4.0.0.min.js"></script>

    <script src='${request.contextPath}/res/js/lib/jquery-ui.min.js'></script>

    <c:if test="${page == 'calendar'}">
        <script src='${request.contextPath}/res/js/lib/moment.min.js'></script>
        <script src='${request.contextPath}/res/js/lib/fullcalendar.min.js'></script>
        <script src='${request.contextPath}/res/js/lib/bootstrap-timepicker.js'></script>
        <script src='${request.contextPath}/res/js/lib/jquery.topzindex.min.js'></script>
    </c:if>

    <script src="${request.contextPath}/res/js/${campus}/${page}.js"></script>
    <script src="${request.contextPath}/res/js/index.js"></script>
    <script>${script}</script>
    <c:remove var="script" scope="session"/>
</body>

</html>