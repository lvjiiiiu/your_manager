
// フルcalendar

// $(function () {
//     eventCalendar();

//   function eventCalendar() {
//     return $('#calendar').fullCalendar({});
//   };
//   function clearCalendar() {
//       $('#calendar').html('');
//   };
// });


$(function () {
  function eventCalendar() {
    return $('#calendar').fullCalendar({});
  };
  function clearCalendar() {
    $('#calendar').html('');
  };
  $(document).on('turbolinks:load', function () {
  eventCalendar();
  });
  $(document).on('turbolinks:before-cache', clearCalendar);

  $('#calendar').fullCalendar({
    events: '/calendars.json',
    titleFormat: 'YYYY年 M月',
    eventTextColor: 'black',
    eventColor: '#87cefa',
    navLinks: true,
    selectable: true,
    selectHelper: true,
    // 日付クリック
    // dayClick : function ( date , jsEvent , view ) {
    //   $('#inputScheduleForm').modal('show');
    // },
    // event クリックで編集、削除
    eventClick : function(event, jsEvent , view) {
      jsEvent.preventDefault();
      $(`#task_item_${task.id}`).modal('show');
    },

    eventRender: function(event, element) {
      element.css("font-size", "0.8em");
      element.css("padding", "5px");
    },
    

    // eventClick : function(event, jsEvent , view) {
    //   jsEvent.preventDefault();
    //   $(`#inputScheduleEditForm${event.id}`).modal('show');
    // },

  });
});











// $('#calendar').fullCalendar ({
//     header: {
//         left: 'prev,next today',
//         center: 'month,agendaWeek,agendaDay',
//         right: 'title'
//     },

//     buttonText: {
//           prev: "<",
//           next: ">"
//     },

//     timezone: 'UTC',
//     events: '/tasks.json',
//     navLinks: true,
//     selectable: true,
//     selectHelper: true,
//     // 日付クリック
//     dayClick : function ( date , jsEvent , view ) {
//         $('#task-modal').modal('show');
//         },

//     event クリックで編集、削除
//     eventClick : function(event, jsEvent , view) {
//         jsEvent.preventDefault();
//         $(`#inputScheduleEditForm${event.id}`).modal('show');
//     },

//     eventMouseover : function(event, jsEvent , view) {
//         jsEvent.preventDefault();
//     }
// })