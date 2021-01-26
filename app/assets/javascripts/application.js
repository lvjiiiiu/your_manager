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


// let sortable = Sortable.create(task_item_draggable, {
//    group: "task_item_draggable",
//     animation: 100
// })






$(document).on('turbolinks:load', function(){
    function dragEnd(evt) {
        console.log(evt)
        console.log(String(evt.to))
    }
    var el = document.getElementById("sortable_task_1")
    var sortable = Sortable.create(el, {
        draggable: '.draggable-item',
        group: {
            name: "shares",
        },
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
        onAdd: function(evt) {
            dragEnd(evt)
        }
    })
});



