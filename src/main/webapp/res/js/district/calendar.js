$(document).ready(function() {
    var calendar = $('#calendar'),
        eventDateStart = $('#eventDateStart'),
        eventDateEnd = $('#eventDateEnd'),
        eventDates = $('#eventDateStart, #eventDateEnd'),
        eventTimeStart = $('#eventStartTime'),
        eventTimeEnd = $('#eventEndTime'),
        eventTimes = $('#eventStartTime, #eventEndTime'),
        allDay = $('#allDay'),
        recurring = $('#recurring'),
        exportDateStart = $('#exportDateStart'),
        exportDateEnd = $('#exportDateEnd'),
        exportDates = $('#exportDateStart #exportDateEnd'),
        updateResources = $('#updateResources'),
        updateCategories = $('#updateCategories');

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
            left: 'refresh today',
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
        resources: [
            {
                id: 'unassigned',
                title: 'Unassigned'
            },
            {
                id: 'athleticEvent',
                title: 'Athletic Event'
            },
            {
                id: 'athleticPractice',
                title: 'Athletic Practice'
            }
        ],
        events: {
            url: '/ical/json/range',
            data: { calendar: 'district' },
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

    console.log($.datepicker.formatDate('yy-mm-dd', calendar.fullCalendar('getView').start._d));
    console.log($.datepicker.formatDate('yy-mm-dd', calendar.fullCalendar('getView').end._d));

    $('#eventCategoryFieldset :radio').change(function() {
       $('#eventCategory').text($('[for='+$(this).attr("id")+']').text());
    });

    eventDates.datepicker().datepicker('setDate', new Date());
    exportDates.datepicker().datepicker('setDate', new Date());
    eventTimes.timepicker();
    $('#allDay, #recurring').checkboxradio();

    $('.hasDatepicker').click(function() {
        $('.ui-datepicker').css('z-index', $.topZIndex() + 1);
    });

    allDay.change(function() {
        if ($(this).prop('checked')) {
            eventTimeStart.timepicker('clear');
            eventTimeStart.prop('disabled', true);
            eventTimeEnd.timepicker('clear');
            eventTimeEnd.prop('disabled', true);
        } else {
            eventTimeStart.prop('disabled', false);
            eventTimeStart.timepicker('setDefaultTime');
            eventTimeStart.timepicker('updateFromWidgetInputs');
            eventTimeEnd.prop('disabled', false);
            eventTimeEnd.timepicker('setDefaultTime');
            eventTimeEnd.timepicker('updateFromWidgetInputs');
        }
    });

    eventDateStart.change(function() {
        if (new Date(eventDateEnd.val()) < new Date(eventDateStart.val()) || eventDateEnd.val() === '') {
            eventDateEnd.val(eventDateStart.val());
        }
    });
    eventDateEnd.change(function() {
        if (new Date(eventDateEnd.val()) < new Date(eventDateStart.val()) || eventDateStart.val() === '') {
            eventDateStart.val(eventDateEnd.val());
        }
    });

    exportDateStart.change(function() {
        if (new Date(exportDateEnd.val()) < new Date(exportDateStart.val()) || exportDateEnd.val() === '') {
            exportDateEnd.val(exportDateStart.val());
        }
    });
    exportDateEnd.change(function() {
        if (new Date(exportDateEnd.val()) < new Date(exportDateStart.val()) || exportDateStart.val() === '') {
            exportDateStart.val(exportDateEnd.val());
        }
    });

    $(window).resize(function() {
        $('.fc-scroller').css('height', '100%!important', 'overflow', 'show');
    });
});

