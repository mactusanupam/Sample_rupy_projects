// Place all the behaviors and hooks related to the matching controller here.
// All this logic will automatically be available in application.js.


$(document).ready(function() {

	$('.jd-editor-form').on('change', '.jd_company', function(e){
    var valueSelected = this.value;
    var companyFields = $(this).parents('.jd_form').children('.jd-company-fields');

    if (!valueSelected) {
      companyFields.find('input, textarea').prop('disabled', false);
      companyFields.removeClass('hide');
    } else {
      companyFields.find('input, textarea').attr('disabled', true);
      companyFields.addClass('hide');
    }
  });

  $(document).on('click', '.resp-add', function(){
    var elem = '<li>'+$(this).parent().html()+'</li>';
    $('.selected-responsibilities').find('ul').append(elem);

    $('.selected-responsibilities ul li:last-child').children('a.resp-add').addClass('hide');
    $('.selected-responsibilities ul li:last-child').children('a.resp-li').removeClass('hide');
    $(this).parent().remove();
  });

  $(document).on('click', '.req-li, .resp-li', function(){
    $(this).parent().remove();
  });

  //requirement manipulation
  $(document).on('click', '.work_requirement, .edu_requirement', function(){
    var textarea = $(this).parent().prev('div').find('textarea');

    if(textarea.val().trim().length == 0) {
      alert('Please enter some text');
    } else {
      var ulElem = $(this).parents('.form-group').next('.requirements').find('ul');

      if($(this).hasClass('work_requirement')) {
        name = 'job_requirements[work_requirements][]';
      } else {
        name = 'job_requirements[education_requirements][]';
      }

      var elem = '<li><input type="hidden" name="'+name+'" value="'+textarea.val()+'">'+textarea.val();
      elem += '<a href="javascript:void(0)" class="btn btn-xs btn-danger req-li pull-right">Remove</a></li>';
      textarea.data("wysihtml5").editor.clear();

      ulElem.append(elem);
    }
  });
});
