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

  $('.digital_cv_honor_and_awards_award_date .form-inline, .digital_cv_certifications_date .form-inline, .personal_detail_date_of_birth .form-inline').removeClass('col-sm-12 no-padding').addClass('col-sm-9');
  $('.edit_contact_detail .control-label').removeClass('col-sm-2');

  $(".resume-editor").on("change", 'input[type=checkbox]', function(e){
    var endDate = $(this).parents('.checkbox').parents('.form-group').prev('div.col-sm-4');
    endDate.find('input, select').prop('disabled', function(i, v) { return !v; });
    endDate.toggle();
  });

  //Show New company form
  $('.resume-editor').on('change', '.cv_company', function(e){
    var valueSelected = this.value;
    var companyFields = $(this).parents('.employer-details').children('.cv-company-fields');

    if (!valueSelected) {
      companyFields.find('input').prop('disabled', false);
      companyFields.removeClass('hide');
    } else {
      companyFields.find('input').attr('disabled', true);
      companyFields.addClass('hide');
    }
  });
})
