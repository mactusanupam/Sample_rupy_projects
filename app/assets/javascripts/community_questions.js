// Place all the behaviors and hooks related to the matching controller here.
// All this logic will automatically be available in application.js.

$(document).ready(function() {

  $('.cancel_add_comment').click(function(e) {
    e.preventDefault();

    var id = $(this).attr('id');

    $('#add_comment_errors'+id).hide();
    $(this).closest('.comments').hide();
    $('.new_comment'+id).show();
  });
});

function show_add_comment(id) {
  $('#add_comment_errors'+id).hide();
  $(".new_comment"+id).hide();
  $("#add_comment"+id).removeClass("hidden");
  $("#add_comment"+id).show();
}
