// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, or any plugin's
// vendor/assets/javascripts directory can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file. JavaScript code in this file should be added after the last require_* statement.
//
// Read Sprockets README (https://github.com/rails/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require jquery3
//= require popper
//= require bootstrap-sprockets
//= require rails-ujs
//= require activestorage
//= require turbolinks
//= require_tree .



$(document).on('turbolinks:load', function(){
  function dragEnd(evt) {
    var item = evt.item;
    var item_id = $(item).find('.item').attr('value')
    var matrix_id = evt.to.id

    $.ajax({
      url: "tasks/" + item_id + "/change_matrix",
      type: "patch",
      dataType: 'json',
      data: { matrix_id }
    });
  }

  var el = document.getElementById("sortable_task_1")
  var sortable = Sortable.create(el, {
    draggable: '.draggable-item',
    group: {
      name: "shares",
    },
    animation: 250,
    onAdd: function(evt) {
      dragEnd(evt)
    }
  })

  var el = document.getElementById("sortable_task_0")
  var sortable = Sortable.create(el, {
    draggable: '.draggable-item',
    group: {
      name: "shares",
    },
    animation: 250,
    onAdd: function(evt) {
      dragEnd(evt)
    }
  })

  var el = document.getElementById("sortable_task_3")
  var sortable = Sortable.create(el, {
    draggable: '.draggable-item',
    group: {
      name: "shares",
    },
    animation: 250,
    onAdd: function(evt) {
      dragEnd(evt)
    }
  })

  var el = document.getElementById("sortable_task_2")
  var sortable = Sortable.create(el, {
    draggable: '.draggable-item',
    group: {
      name: "shares",
    },
    animation: 250,
    onAdd: function(evt) {
      dragEnd(evt)
    }
  })
});



