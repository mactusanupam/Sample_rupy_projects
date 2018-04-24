// Place all the behaviors and hooks related to the matching controller here.
// All this logic will automatically be available in application.js.

$(document).ready(function() {
	$(".status, .job-search").chosen({disable_search_threshold: 10});
	$(".post-job").chosen({
		allow_insertion: true,
		disable_search_threshold: 10
	});

	$("select.post-job-skills").on('change',function(){
		var selSkillTitle = $(this).find('option:last-child').val();
		saveNewSkill($(this),selSkillTitle);
	});
});
