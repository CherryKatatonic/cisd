var carousel = $('#carouselHeader');
var globalLinkContainer = $('#global-link-container');
var globalLinkGroup = $('#global-link-group');
var sidenav = $('#side-nav');
var nav1 = $('#nav1');
var nav2 = $('#nav2');
var navbar2 = $('#navbar2');
var nav1Links = $('#nav1-links');
var nav2Links = $('#nav2-links');
var navItems = $('.nav-item');
var searchBar = $('#search-bar');
var brandBarInner = $('#brand-bar-inner');

if (carousel.length) {
    nav2.addClass('nav2-transparent');
    globalLinkContainer.appendTo(carousel);
    globalLinkContainer.addClass('global-links-abs');
} else {
    nav2.addClass('nav2-dark');
    globalLinkContainer.addClass('global-links-rel');
}

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

$('#scroll-top-btn').click(function(){
    $('html, body').animate({ scrollTop: 0 }, 'slow');
    return false;
});

$('#navbar-toggle').click(function() {
    sidenav.toggleClass('d-none');
});

$('#loginTablist > a').click(function() {
    $(this).closest('.dropdown').addClass('active');
})

$('.dropdown').on('hide.bs.dropdown', function(e) {
    if ($(this).hasClass('active')){
        e.preventDefault();
    }
    $(this).removeClass('active');
});

function hideNavs() {
    brandBarInner.prependTo(nav1);
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
    brandBarInner.prependTo($('#brand-bar'));
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

