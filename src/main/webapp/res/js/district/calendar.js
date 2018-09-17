$(document).ready(function() {
    $('#calendar').fullCalendar({
        header: {
            left: 'today',
            center: 'prev title next',
            right: 'listDay,listWeek,month'
        },

        views: {
            listDay: { buttonText: 'Day', titleFormat: 'MMM D' },
            listWeek: { buttonText: 'Week', titleFormat: 'MMM D' },
            month: { buttonText: 'Month', titleFormat: 'MMMM YYYY' },
        },

        buttonText: { today: 'Today' },
        defaultView: 'month',
        navLinks: true,
        editable: true,
        eventLimit: true,
        events: '/ical-feed?id=district'
    });
});