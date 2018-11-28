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

function saveNewItem($this, element){
  var selTitle = $this.find('option:last-child').val();
  var elem = $this.find('option:last-child');

  if(isNaN(parseInt(selTitle))){
    $.ajax({
      url: "/save_new_"+element,
      type: 'post',
      dataType: 'json',
      data:{title: selTitle},
      success:function(data){
        elem.val(data);
      }
    });
  }
}

