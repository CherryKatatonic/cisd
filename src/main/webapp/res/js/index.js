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

$(document).ready(function() {
    if (carousel) {
        globalLinkContainer.appendTo(carousel);
        globalLinkContainer.addClass('global-links-abs');
    } else {
        globalLinkContainer.addClass('global-links-rel');
    }
});

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

$('#scroll-top-btn').click(function(){
    $('html, body').animate({ scrollTop: 0 }, 'slow');
    return false;
});

function hideNavs() {
    brandBarInner.prependTo(nav1);
    globalLinkGroup.prependTo($('#global-link-dropdown'));
    globalLinkGroup.addClass('btn-group-vertical');
    nav1Links.appendTo(sidenav);
    nav2Links.prependTo(sidenav);
    searchBar.prependTo(sidenav);
    navItems.addClass('w-100');
    navbar2.hide();
}

function showNavs() {
    brandBarInner.prependTo($('#brand-bar'));
    globalLinkGroup.prependTo(globalLinkContainer);
    globalLinkGroup.removeClass('btn-group-vertical');
    nav2Links.prependTo(nav2);
    nav1Links.appendTo(nav1);
    searchBar.appendTo(nav1);
    navItems.removeClass('w-100');
    navbar2.show();
}

$('#navbar-toggle').click(function() {
    sidenav.toggleClass('d-none');
});