// Place all the behaviors and hooks related to the matching controller here.
// All this logic will automatically be available in application.js.



$(document).ready(function(){

  $(".degree, .specialization, .qualification, .skill, .industry, .company .min_exp, .max_exp, .job-search").select2({
      tags: true
    });

    $(".degree, .specialization, .skill").off('select2:select').on('select2:select', function(e) {
      /*elem = $(this).hasClass('specialization') || $(this).hasClass('degree') || $(this).hasClass('skill');*/
      elem = $(this).hasClass('specialization') ? 'skill':'degree';
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
});


$(document).ready(function(){
  $('#job_form_id').on('change', '.job_location input[type=checkbox]', function() {
  // Does some stuff and logs the event to the console
  if($(this).is(':checked')) {
    alert('ppppppppppp...................');
      $('.location').value == $(this).value;
    } else {
      alert('ppppppppppp...................');
      $('.location').value == $('.location').value;
    }
  });
});


