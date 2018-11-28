// Place all the behaviors and hooks related to the matching controller here.
// All this logic will automatically be available in application.js.

$(document).ready(function(){
  // Carousel for digital CV Landing Page
  $('.carousel[data-type="multi"] .item').each(function() {
    var next = $(this).next();

    if (!next.length) {
      next = $(this).siblings(':first');
    }

    next.children(':first-child').clone().appendTo($(this));

    for (var i = 0; i < 1; i++) {
      next = next.next();
      if (!next.length) {
        next = $(this).siblings(':first');
      }

      next.children(':first-child').clone().appendTo($(this));
    }
  });

  // Add minus icon for collapse element which is open by default
  $(".collapse.in").each(function(){
    $(this).siblings(".panel-heading").find(".glyphicon").addClass("glyphicon-minus").removeClass("glyphicon-plus");
  });

  // Toggle plus minus icon on show hide of collapse element
  $(".collapse").on('show.bs.collapse', function(){
    $(this).parent().find(".glyphicon").removeClass("glyphicon-plus").addClass("glyphicon-minus");
  }).on('hide.bs.collapse', function(){
    $(this).parent().find(".glyphicon").removeClass("glyphicon-minus").addClass("glyphicon-plus");
  });

})
