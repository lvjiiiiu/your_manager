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
//= require jquery
//= require jquery3
//= require popper
//= require bootstrap-sprockets
//= require rails-ujs

//= require jquery-ui/widgets/sortable
//= require jquery-ui/widgets/draggable
//= require jquery-ui/widgets/droppable
//= require jquery-ui/effect.all
//= require jquery-ui/effects/effect-highlight

//= require activestorage
//= require turbolinks
//= require_tree .



$(document).ready(function () {
  $('.jquery').on('click', function(){
    $(this).css('color','red');
  });
});


  $(function(){
    $('.item').draggable({
      // helper: 'clone',          //クローン（残像）を出す設定
      scroll: false,            //ドラッグされるときはスクロールOFF
      stack: '.item',           //ドラッグした要素が一番上に来る
      // start: function(){
      //   $(this).hide();         //ドラッグ中はクローン元を消す
      // },
      // stop: function(){
      //   $(this).show()         //移動後にクローン元（移動済み）を表示させる





    });
    $('.drop_area').droppable({
      activate: function(e,ui) {
        $(this)
          // .find("p")
          // .html("ドラッグが開始されました");
      },
      over: function(e,ui) {
        $(this)
          .css('background', '#e0ffff')
          .css('border', '2px solid #00bfff')
          // .find("p")
          // .html("ドロップエリアに入りました" );
      },
      out: function(e,ui) {
        $(this)
          // .css('background', '#ffffe0')
          // .css('border', '2px solid #ffff00')
          // // .find("p")
          // .html("ドロップエリアから外れました");
      },
      drop: function(e,ui) {
        $(this)
          // .addClass("ui-state-highlight")
          // .css('background', '#fdf5e6')
          // .css('border', '2px solid #ffa07a')
          // .find( "p" )
          // .html( "ドロップされました" );
      }
    });
  });


// ("#task_<%= task.id %>.task_matrix")