// Place all the behaviors and hooks related to the matching controller here.
// All this logic will automatically be available in application.js.



$(document).ready(function(){

  $(".qualification, .industry, .company, .min_exp, .max_exp, .job-search").select2();

  $(".degree, .specialization, .skill").select2({
    tags: true
  });

  $(".degree, .specialization, .skill").off('select2:select').on('select2:select', function(e) {
    elem = '';
    if($(this).hasClass('specialization'))
      elem = 'specialization';
    else if($(this).hasClass('skill'))
      elem = 'skill'
    else
      elem = 'degree';

    saveNewItem($(this), elem);
  });

  $('#job_form_id .wysihtml5').wysihtml5({ toolbar: {
    'font-styles': false,
    'color': false,
    'emphasis': {
    'small': false
    },
    'blockquote': false,
    'lists': true,
    'html': false,
    'link': true,
    'image': false,
    'smallmodals': false
    }
  });

  $('.job_seniority_level, .job_description').find('label.col-sm-3').removeClass('col-sm-3').addClass('col-sm-2');
});
