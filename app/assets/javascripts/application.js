// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or any plugin's vendor/assets/javascripts directory can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file.
//
// Read Sprockets README (https://github.com/rails/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require jquery
//= require jquery.turbolinks
//= require jquery_ujs
//= require turbolinks
//= require_tree .
//= require websocket_rails/main

var ws_rails = new WebSocketRails("192.168.0.103:3000/websocket");

$(document).ready(function() {
  $('.visualization').on('click', function(e){
    var id = $(this).data('id');

    $.ajax({
       url: '/product/render_json/'+id+'',
       data: {
          format: 'json'
       },
       error: function() {
          console.log('error');
       },
       dataType: 'json',
       success: function(data) {
         ws_rails.trigger("message", data);
       },
       type: 'GET'
    });
  })

  ws_rails.bind("message", function(message){
    $('#product_' + message.id).fadeTo(100, 0.1).fadeTo(200, 1.0, function(){
      $('#product_' + message.id + ' p').first().text('Visualizado na home ' + message.visualization_in_home);
      $('#product_' + message.id + ' p').last().text('Clicado: ' + message.clicks);

    });

  })
});
