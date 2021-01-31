
// フルcalendar

$(function () {

  $('#calendar').fullCalendar({
    events: '/calendars.json',
    titleFormat: 'YYYY年 M月',
    eventTextColor: 'black',
    eventColor: '#87cefa',
    navLinks: true,
    selectable: true,
    selectHelper: true,

    // event クリックで編集、削除
    eventClick : function(event, jsEvent , view) {
      jsEvent.preventDefault();

      $(`#inputScheduleEditForm${event.id}`).modal('show');
    },

    eventRender: function(event, element) {
      element.css("font-size", "0.8em");
      element.css("padding", "5px");
    },

  });
});


