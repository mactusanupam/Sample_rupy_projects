$(document).ready(function(){
  $(".select_country").on("change",function(){
    var selcountry = $(this).val().toLowerCase();
    if($(this).hasClass("current")) {
      getAllStatesData(selcountry, '.current');
    } else {
      getAllStatesData(selcountry, '.prefferred');
    }
  });

  $(".select_state").on("change",function(){
    var selstate = $(this).val().toLowerCase();
    if($(this).hasClass("current")) {
      var selcountry = $(".current.select_country").val().toLowerCase();
      getAllCitiesData(selcountry, selstate, '.current');
    } else {
      var selcountry = $(".prefferred.select_country").val().toLowerCase();
      getAllCitiesData(selcountry, selstate, '.prefferred');
    }
  });
});

function getAllStatesData(selcountry, class_elem){
  if(selcountry == ""){
    $(class_elem+".select_state").empty();
    $(class_elem+".select_city").empty();
    return ;
  }
  $.ajax({
    url: '/states/'+ selcountry,
    success: function(data) {
      var opt;
      opt='<option value="" selected>Select State</option>';
      for (var code in data){
        opt += '<option value="' + code + '">' + data[code] + '</option>';
      };
      $(class_elem+".select_state").empty();
      $(class_elem+".select_city").empty();
      alert($(class_elem+".select_city").html());
      $(class_elem+".select_state").append(opt);
    }
  });
}

function getAllCitiesData(selcountry, selstate, class_elem){
  if(selstate == ""){
    $(class_elem+".select_city").empty();
    return ;
  }
  $.ajax({
    url: '/cities/',
    data: { country: selcountry, state: selstate },
    method: 'get',
    success: function(data) {
      var opt;
      opt='<option value="" selected>Select City</option>';
      for (var code in data){
        opt += '<option value="' + data[code] + '">' + data[code] + '</option>';
      }
      $(class_elem+".select_city").empty();
      $(class_elem+".select_city").append(opt);
    }

  });
}

function saveNewSkill($this,selSkillTitle){
  var elem = $this.find('option:last-child');
  if(isNaN(parseInt(selSkillTitle))){
    $.ajax({
      url: "/save_new_skill",
      type: 'post',
      dataType: 'json',
      data:{skill_title:selSkillTitle},
      success:function(data){
        elem.val(data);
      }
    });
  }
}

function saveNewLanguage($this,selLangName){
  var elem = $this.find('option:last-child');
  if(isNaN(parseInt(selLangName))){
    $.ajax({
      url: "/save_new_language",
      type: 'post',
      dataType: 'json',
      data:{language_name:selLangName},
      success:function(data){
        elem.val(data);
      }
    });
  }
}
