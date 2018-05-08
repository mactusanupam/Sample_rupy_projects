// Place all the behaviors and hooks related to the matching controller here.
// All this logic will automatically be available in application.js.



$(document).ready(function(){
  $('.qualifications, .post-job-skills, .job-search').select2({ tags: true });

  $(".essential_skills, .post-job-skills, .job-search").on('change',function(){
    var qualifications = $(this).find('option:last-child').val();
    saveNewSkill($(this),selSkillTitle);
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
