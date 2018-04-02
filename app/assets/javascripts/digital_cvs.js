// Place all the behaviors and hooks related to the matching controller here.
// All this logic will automatically be available in application.js.

$(document).ready(function(){

  //show/hide end date button based on checkbox selection
  $(".exp-form, .academic-form").on("change", 'input[type=checkbox]', function(e){
    var endDate = $(this).parents('.form-group').siblings('.end-date');
    endDate.find('input').prop('disabled', function(i, v) { return !v; });
    endDate.toggle();
  });

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
