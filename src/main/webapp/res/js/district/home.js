var upcomingEventsCard = $('#upcomingEventsCard');
var upcomingEventsButton = $('#upcomingEventsButton');
var upcomingEventsHeader = $('#upcomingEventsHeader');
var dynamicLinks =
    $('<li class="nav-item active">\n' +
    '    <a class="nav-link" href="/">HOME</a>\n' +
    '</li>\n' +
    '<li class="nav-item">\n' +
    '    <a class="nav-link" href="/about">ABOUT US</a>\n' +
    '</li>\n' +
    '<li class="nav-item">\n' +
    '    <a class="nav-link" href="/athletics">ATHLETICS</a>\n' +
    '</li>\n' +
    '<li class="nav-item">\n' +
    '    <a class="nav-link" href="/departments">DEPARTMENTS</a>\n' +
    '</li>\n' +
    '<li class="nav-item">\n' +
    '    <a class="nav-link" href="/community">PARENTS & COMMUNITY</a>\n' +
    '</li>\n' +
    '<li class="nav-item">\n' +
    '    <a class="nav-link" href="/staff">STAFF</a>\n' +
    '</li>\n' +
    '<li class="nav-item">\n' +
    '    <a class="nav-link" href="/calendar">CALENDAR</a>\n' +
    '</li>');

$('#nav2-links').append(dynamicLinks);

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
    upcomingEventsCard.appendTo($('#home-col-right'));
    upcomingEventsButton.addClass('d-none');
    upcomingEventsHeader.prependTo(upcomingEventsCard);
}