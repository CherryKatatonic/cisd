// VARIABLE DECLARATIONS
var carousel = $('#carouselHeader'),
    globalLinkContainer = $('#global-link-container'),
    globalLinkGroup = $('#global-link-group'),
    sidenav = $('#side-nav'),
    nav1 = $('#nav1'),
    nav2 = $('#nav2'),
    navbar2 = $('#navbar2'),
    nav1Links = $('#nav1-links'),
    nav2Links = $('#nav2-links'),
    navItems = $('.nav-item'),
    searchBar = $('#search-bar'),
    mainLogo = $('#main-logo'),
    emailRex = new RegExp("[a-zA-Z0-9._%+-]+@cisd.org$");

// DETERMINE DYNAMIC NAVBAR APPEARANCE
if (carousel.length) {
    nav2.addClass('nav2-transparent');
    globalLinkContainer.appendTo(carousel);
    globalLinkContainer.addClass('global-links-abs');
} else {
    nav2.addClass('nav2-dark');
    globalLinkContainer.addClass('global-links-rel');
}

// SET INITIAL RESPONSIVE VIEW
if (window.innerWidth < 768) {
    hideNavs();
}

$(window).resize(function() {
    if (window.innerWidth < 768) {
        hideNavs();
    } else {
        showNavs();
    }
});

// RESPONSIVE BEHAVIOR FUNCTIONS
function hideNavs() {
    mainLogo.prependTo($('#brand-bar'));
    mainLogo.addClass('position-static mb-5');
    $('#main-logo img').css('width', '85px');
    //brandBarInner.prependTo(nav1);
    globalLinkGroup.prependTo($('#global-link-dropdown'));
    globalLinkGroup.addClass('btn-group-vertical');
    globalLinkContainer.hide();
    nav1Links.appendTo(sidenav);
    nav2Links.prependTo(sidenav);
    $('#nav2-links > .dropdown > a').addClass('dropdown-toggle').attr('data-toggle', 'dropdown');
    searchBar.prependTo(sidenav);
    navItems.addClass('w-100');
    navbar2.hide();
}

function showNavs() {
    mainLogo.prependTo(nav1);
    mainLogo.removeClass('position-static mb-5');
    $('#main-logo img').css('width', '133px');
    //brandBarInner.prependTo($('#brand-bar'));
    globalLinkContainer.show();
    globalLinkGroup.prependTo(globalLinkContainer);
    globalLinkGroup.removeClass('btn-group-vertical');
    nav2Links.prependTo(nav2);
    $('#nav2-links > .dropdown > a').removeClass('dropdown-toggle').attr('data-toggle', '');
    nav1Links.appendTo(nav1);
    searchBar.appendTo(nav1);
    navItems.removeClass('w-100');
    navbar2.show();
}

// EVENT LISTENERS
$('#scroll-top-btn').click(function(){
    $('html, body').animate({ scrollTop: 0 }, 'slow');
    return false;
});

$('#navbar-toggle').click(function() {
    sidenav.toggleClass('d-none');
});

$('#loginTablist > a').click(function() {
    $(this).closest('.dropdown').addClass('active');
});

$('.dropdown').on('hide.bs.dropdown', function(e) {
    if ($(this).hasClass('active')){
        e.preventDefault();
    }
    $(this).removeClass('active');
});

$('#loginEmail, #loginPassword').keyup(function() {
    if($('#loginEmail').val().length > 0 && $('#loginPassword').val().length >= 8) {
        $('#loginSubmit').prop('disabled', false);
    } else {
        $('#loginSubmit').prop('disabled', true);
    }
});

$('#signupEmail, #signupPassword').keyup(function() {
    if(!emailRex.test($('#signupEmail').val())) {
        $('#signupError')
        $('#signupSubmit').prop('disabled', true);
    } else {
        $('#signupSubmit').prop('disabled', false);
    }
});