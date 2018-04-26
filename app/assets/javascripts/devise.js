$(document).ready(function(){

  if($('#user_type_selected input[type="radio"]:checked').val() == 3) {
    $("#show_new_company_list").show();
  }

  if($('#show_new_company_list').find('select').val() == 'others') {
    $("#new_company_check_list").show();
  }


  $(document).on('click', '#user_type_selected', function() {
    $("#user_type_selected").change(function(){
      var user_type_id = $("input[type='radio']:checked").val();

      if(user_type_id == 3){
        $("#show_new_company_list").find('select').prop('disabled', false);
        $("#show_new_company_list").show();
      }
      else {
        $("#show_new_company_list").find('select').prop('disabled', true);
        $("#show_new_company_list").hide();
      }
    });
  });

  $(document).on('change', '#user_company_id', function() {
    var company_id = $(this).val();

    if(company_id == 'others') {
      $("#new_company_check_list").find('input').prop('disabled', false);
      $("#new_company_check_list").find('input').val('');
      $("#new_company_check_list").show();
    } else {
      $("#new_company_check_list").find('input').prop('disabled', true);
      $("#new_company_check_list").hide();
    }

  });

})
