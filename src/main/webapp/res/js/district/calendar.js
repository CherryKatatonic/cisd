$(document).ready(function() {
    var calendar = $('#calendar'),
        eStartDate = $('#eventStartDate'),
        eEndDate = $('#eventEndDate'),
        eDates = $('#eventStartDate, #eventEndDate'),
        eStartTime = $('#eventStartTime'),
        eEndTime = $('#eventEndTime'),
        eTimes = $('#eventStartTime, #eventEndTime'),
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
        },
        eventRender: function(event, element) {
            console.log(event);
            element.qtip({
                content: {
                    title: event.title,
                    text: (event.allDay ? 'All Day' : event.start + event.end) + '\n\r' + event.description
                }
            });
        }
    });

    eDates.datepicker().datepicker('setDate', new Date());
    eTimes.timepicker();
    $('#allDay, #recurring').checkboxradio();

    $('.hasDatepicker').click(function() {
        $('.ui-datepicker').css('z-index', $.topZIndex() + 1);
    });

    allDay.change(function() {
        if ($(this).prop('checked')) {
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

    eStartDate.change(function() {
        if (new Date(eEndDate.val()) < new Date(eStartDate.val()) || eEndDate.val() === '') {
            eEndDate.val(eStartDate.val());
        }
    });
    eEndDate.change(function() {
        if (new Date(eEndDate.val()) < new Date(eStartDate.val()) || eStartDate.val() === '') {
            eStartDate.val(eEndDate.val());
        }
    });

    $(window).resize(function() {
        $('.fc-scroller').css('height', '100%!important', 'overflow', 'show');
    });
});

