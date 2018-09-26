$(document).ready(function() {
    var calendar = $('#calendar'),
        eStartDate = $('#eventStartDate'),
        eEndDate = $('#eventEndDate'),
        eStartTime = $('#eventStartTime'),
        eEndTime = $('#eventEndTime'),
        allDay = $('#allDay'),
        recurring = $('#recurring');
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

    eStartDate.datepicker();
    eEndDate.datepicker();
    eStartTime.timepicker();
    eEndTime.timepicker();
    allDay.checkboxradio();
    recurring.checkboxradio();

    $('.hasDatepicker').click(function() {
        $('.ui-datepicker').css('z-index', $.topZIndex() + 1);
    });

    allDay.change(function() {
        console.log(allDay);
        if (allDay[0].checked) {
            eStartTime.timepicker('clear');
            eStartTime.prop('disabled', true);
            eEndTime.timepicker('clear');
            eEndTime.prop('disabled', true);
        } else {
            eStartTime.prop('disabled', false);
            eStartTime.timepicker('setDefaultTime');
            eStartTime.timepicker('updateFromWidgetInputs');
            eEndTime.prop('disabled', false);
            eEndTime.timepicker('setDefaultTime');
            eEndTime.timepicker('updateFromWidgetInputs');
        }
    });
});

