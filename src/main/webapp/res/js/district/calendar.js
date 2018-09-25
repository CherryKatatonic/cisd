$(document).ready(function() {
    var calendar = $('#calendar');
    calendar.fullCalendar({
        customButtons: {
            refresh: {
                text: 'Refresh',
                click: function () {
                    calendar.fullCalendar('refetchEvents');
                }
            }
        },
        header: {
            left: 'today refresh',
            center: 'prev title next',
            right: 'listDay,listWeek,month'
        },

        views: {
            listDay: {buttonText: 'Day', titleFormat: 'MMM D'},
            listWeek: {buttonText: 'Week', titleFormat: 'MMM D'},
            month: {buttonText: 'Month', titleFormat: 'MMMM YYYY'}
        },

        buttonText: {today: 'Today'},
        defaultView: 'month',
        navLinks: true,
        editable: true,
        eventLimit: true,

        events: {
            url: '/ical/district/range',
            error: function(error) {
                console.log(error)
            },
            success: function(data) {
                console.log(data);
            }
        }
    });

    $('#eventStartDate, #eventEndDate').datepicker();
    $('#eventStartTime, #eventEndTime').timepicker();
    $('#allDay, #recurring').checkboxradio();

    $('.hasDatepicker').click(function() {
        $('.ui-datepicker').css('z-index', $.topZIndex() + 1);
    });

});
