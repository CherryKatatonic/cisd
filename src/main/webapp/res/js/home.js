$(window).ready(function() {
    if (window.innerWidth < 768) {
        hideEvents();
    } else {
        showEvents();
    }
});

$(window).resize(function() {
    if (window.innerWidth < 768) {
        hideEvents();
    } else {
        showEvents();
    }
});

function hideEvents() {
    $('#upcomingEventsCard').appendTo($('#upcomingEventsCollapse'));
    $('#upcomingEventsButton').removeClass('d-none');
    $('#upcomingEventsHeader').prependTo($('#upcomingEventsButton'));
}

function showEvents() {
    $('#upcomingEventsCard').appendTo($('#home-col-right'));
    $('#upcomingEventsButton').addClass('d-none');
    $('#upcomingEventsHeader').prependTo($('#upcomingEventsCard'));

}