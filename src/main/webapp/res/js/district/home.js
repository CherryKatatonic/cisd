var upcomingEventsCard = $('#upcomingEventsCard');
var upcomingEventsButton = $('#upcomingEventsButton');
var upcomingEventsHeader = $('#upcomingEventsHeader');

if (window.innerWidth < 768) {
    collapse();
} else {
    restore();
}

$(window).resize(function() {
    if (window.innerWidth < 768) {
        collapse();
    } else {
        restore();
    }
});

function collapse() {
    upcomingEventsCard.appendTo($('#upcomingEventsCollapse'));
    upcomingEventsButton.removeClass('d-none');
    upcomingEventsHeader.prependTo(upcomingEventsButton);
}

function restore() {
    upcomingEventsCard.appendTo($('#col-sm'));
    upcomingEventsButton.addClass('d-none');
    upcomingEventsHeader.prependTo(upcomingEventsCard);
}