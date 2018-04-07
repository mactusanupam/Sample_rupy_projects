// Place all the behaviors and hooks related to the matching controller here.
// All this logic will automatically be available in application.js.

$(document).ready(function(){

  //CV name inline change
  $('.edit-cv-name').hide();
  $('#cv-name-change').click(function(){
    $('.show-cv-name').hide();
    $('.edit-cv-name').show();
  });

  $('#remove-edit-cv-name').click(function(){
    $('.edit-cv-name').hide();
    $('.show-cv-name').show();
  });
})
