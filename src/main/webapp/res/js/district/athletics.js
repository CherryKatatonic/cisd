var upcomingEventsCard = $('#upcomingEventsCard');
var upcomingEventsButton = $('#upcomingEventsButton');
var upcomingEventsHeader = $('#upcomingEventsHeader');
var dynamicLinks =
    $('<li class="nav-item active">\n' +
        '    <a class="nav-link" href="/athletics">HOME</a>\n' +
        '</li>\n' +
        '<li class="nav-item dropdown hoverdrop">\n' +
        '    <a class="nav-link" href="#" id="aboutDropdown"' +
        '        role="button" aria-haspopup="true" aria-expanded="false">' +
        '        ABOUT US' +
        '    </a>\n' +
        '    <div class="dropdown-menu" aria-labelledby="aboutDropdown">' +
        '        <a class="dropdown-item" href="/athletics/about">Athletic Administration</a>' +
        '        <a class="dropdown-item" href="#">Sports Medicine - Athletic Training Info</a>' +
        '        <a class="dropdown-item" href="#">Advertising at Tiger Stadium</a>' +
        '        <a class="dropdown-item" href="#">Meet the CHS Coaches</a>' +
        '        <a class="dropdown-item" href="#">Meet the CMS Coaches</a>' +
        '    </div>' +
        '</li>\n' +
        '<li class="nav-item">\n' +
        '    <a class="nav-link" href="/athletics/booster-club">BOOSTER CLUB</a>\n' +
        '</li>\n' +
        '<li class="nav-item">\n' +
        '    <a class="nav-link" href="/athletics/facilities">FACILITIES</a>\n' +
        '</li>\n' +
        '<li class="nav-item">\n' +
        '    <a class="nav-link" href="https://corsicanaisd.rankonesport.com/New/Home.aspx">FORMS</a>\n' +
        '</li>\n' +
        '<li class="nav-item">\n' +
        '    <a class="nav-link" href="/athletics/schedules">SCHEDULES</a>\n' +
        '</li>\n' +
        '<li class="nav-item">\n' +
        '    <a class="nav-link" href="/athletics/sports">SPORTS</a>\n' +
        '</li>' +
        '<li class="nav-item">\n' +
        '    <a class="nav-link" href="/athletics/calendar">CALENDAR</a>\n' +
        '</li>');

$('#brand-name-top').text('CORSICANA ATHLETICS');
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