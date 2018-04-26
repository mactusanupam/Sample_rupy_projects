$(document).on('click', '#user_type_selected', function() {
  $("#user_type_selected").change(function(){
    var user_type_id = $("input[type='radio']:checked").val();

    if(user_type_id == 3 || user_type_id == 6){
      /*$("label[for='user_email']").html("Company Email");*/
      $("#show_new_company_list").show();
    }
    else{
      /*$("label[for='user_email']").html("Email");*/
      $("#show_new_company_list").hide();
    }
  });
});

$(document).on('change', '#user_company_id', function() {
  $("#user_company_id").click(function(){
      var company_id = $(this).val();
      if(company_id == '')
        $("#new_company_check_list").show();
      else
        $("#new_company_check_list").hide();
  });
});

