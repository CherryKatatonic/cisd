$(document).ready(function() {
    // INIT VARIABLES
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
        exportDates = $('#exportDateStart, #exportDateEnd'),
        updateResources = $('#updateResources'),
        updateCategories = $('#updateCategories');

    // INIT CALENDAR
    calendar.fullCalendar({
            // Custom buttons
        customButtons: {
            refresh: {
                text: 'Refresh',
                click: function () {
                    calendar.fullCalendar('refetchEvents');
                }
            }
        },
            // Header
        header: {
            left: 'refresh today',
            center: 'prev title next',
            right: 'listDay,listWeek,month'
        },
            // Views
        views: {
            listDay: {buttonText: 'Day', titleFormat: 'MMM D'},
            listWeek: {buttonText: 'Week', titleFormat: 'MMM D'},
            month: {buttonText: 'Month', titleFormat: 'MMMM YYYY'}
        },
            // Misc settings
        buttonText: {today: 'Today'},
        defaultView: 'month',
        navLinks: true,
        editable: true,
        eventLimit: true,
            // Resources
        resources: [],
            // Events
        events: {
            url: '/ical/json/range',
            data: { calendar: ['district'] },
            error: function(error) {
                console.log(error)
            },
            success: function(data) {
                console.log(data);
            }
        },
            // Event Render
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

    // INIT INPUTS
    eventDates.datepicker().datepicker('setDate', new Date());
    exportDates.datepicker().datepicker('setDate', new Date());
    eventTimes.timepicker();
    $('#allDay, #recurring').checkboxradio();

    // EVENT HANDLERS

        // Always display full calendar height
    $(window).resize(function() {
        $('.fc-scroller').css('height', '100%!important', 'overflow', 'show');
    });

        // Display selected category for new event
    $('#eventCategoryFieldset :radio').change(function() {
       $('#eventCategory').text($('[for='+$(this).attr("id")+']').text());
    });

        // Prevent datepickers from being hidden behind modal
    $('.hasDatepicker').click(function() {
        $('.ui-datepicker').css('z-index', $.topZIndex() + 1);
    });

        // Change date/time inputs when allDay is checked/unchecked
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

        // Ensure that start dates and end dates remain valid
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
        // --------------------------------------------------

        // Set export dates to current view when export menu is opened
    $('button[data-target="#exportModal"]').click(function() {
        exportDateStart.datepicker('setDate', calendar.fullCalendar('getView').start._d);
        exportDateEnd.datepicker('setDate', calendar.fullCalendar('getView').end._d);
    });

        // Export selected date range of selected calendars
    $('#exportRange').click(function() {
        var calendars = [],
            start = $.datepicker.formatDate('yy-mm-dd', new Date(exportDateStart.val())),
            end = $.datepicker.formatDate('yy-mm-dd', new Date(exportDateEnd.val()));

        $('#calendarsDropdown form input:checkbox:checked').each(function() {
            calendars.push($(this).val());
        });

       $.ajax({
           type: 'GET',
           url: '/ical/export/range',
           data: {
               calendar: calendars,
               start: start,
               end: end,
               _: Date.now()
           },
           xhrFields: {
               responseType: 'blob'
           },
           error: function(jqXHR, status, message) {
                console.log(message);
           },
           success: function(data, status, jqXHR) {
               var cdis = jqXHR.getResponseHeader('content-disposition');
               var filename = cdis.substring(cdis.indexOf('=') + 1);
               var a = document.createElement('a');
               var url = window.URL.createObjectURL(data);
               a.href = url;
               a.download = filename;
               a.click();
               window.URL.revokeObjectURL(url);
           }
       });
    });
});

