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
<<<<<<< HEAD
//= require rails-ujs
//= require turbolinks
//= require_tree .
=======
//= require jquery3
//= require rails-ujs
//= require cocoon
//= require twitter/bootstrap
//= require select2
//= require bootstrap-wysihtml5
//= require alertify
//= require intlTelInput
//= require libphonenumber/utils
//= require_tree .


$(document).ready(function(){

  $(window).on('popstate', function() {
    location.reload(true);
  });

  //disable char input in number fields
  $(document.body).on('keypress', "input[type=number]", function(){
    return (event.charCode == 8 || event.charCode == 0 || event.charCode == 46) ? null : event.charCode >= 48 && event.charCode <= 57;
  });
})
>>>>>>> 967eb6bf2ecfd5b1ec932c74e24ca2d87334443d
