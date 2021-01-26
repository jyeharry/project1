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
//= require rails-ujs
//= require jquery
//= require popper
//= require bootstrap-sprockets
//= require_tree .

const pathname = window.location.pathname;
$(document).ready(function () {
  switch (pathname) {
    case '/bars':
      $('.nav-item').removeClass('active');
      $('#explore-link').addClass('active');
      break;
    case '/users/new':
      $('.nav-item').removeClass('active');
      $('#sign-up-link').addClass('active');
      break;
    case '/sessions/new':
      $('.nav-item').removeClass('active');
      $('#sign-in-link').addClass('active');
      break;
    case '/bars/saved':
      $('.nav-item').removeClass('active');
      $('#saved-bars-link').addClass('active');
      break;
  }
})
