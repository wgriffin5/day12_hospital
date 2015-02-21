

$(document).ready(function(){

$("#error").fadeOut(5000);
$("#notice").fadeOut(5000);

$(".form-control").blur(function() {
  console.log( $(this).val());
if ($('.form-control').val().length > 0){
    $(".submit-button").removeAttr("disabled");
  }
  else {
    $('.submit-button').attr("disabled");
  }

});
});
$(document).on('click', '.search-patients', function() {
  console.log("yolo");
  var hospital_id = $(".hospital-id").val()
  var search = $(".patient-search").val()
  $.ajax({
    type: 'GET',
    url: '/hospitals/' + hospital_id + '/patients/search_results',
    dataType: 'script',
    data: {q: search}
  });
  console.log(search);
  console.log(hospital_id);
});

$(document).on('click', '.wait-patient', function(){
  console.log("wait")
  hospital_id = $("#hospital_id").val()
  patient_id = $("#patient_id").val()
  $.ajax({
    type: 'PATCH',
    url: '/hospitals/' + hospital_id + '/patients/' + patient_id + '/patient_waiting'
    // dataType: 'script' 
  });
  console.log("waitjax")
});

$(document).on('click', '.check-up-patient', function(){
  console.log("check")
  hospital_id = $("#hospital_id").val()
  patient_id = $("#patient_id").val()
  $.ajax({
    type: 'PATCH',
    url: '/hospitals/' + hospital_id + '/patients/' + patient_id + '/patient_checking_up',
    // dataType: 'script'
  });
  console.log("checkjax")
});

$(document).on('click', '.x-ray-patient', function(){
  console.log("xray")
  var hospital_id = $(this).attr("hospital_id")
  var patient_id = $(this).attr("patient_id")
  $.ajax({
    type: 'PATCH',
    url: '/hospitals/' + hospital_id + '/patients/' + 
    patient_id + '/patient_x_raying',
    // dataType: 'script'
  });
  console.log("xrayjax")

});

$(document).on('click', '.surgery-patient', function(){
  console.log("surgery")
  var hospital_id = $(this).attr("hospital_id")
  var patient_id = $(this).attr("patient_id")
  $.ajax({
    type: 'PATCH',
    url: '/hospitals/' + hospital_id + '/patients/' + patient_id + '/patient_surged',
    // dataType: 'script'
  });
  console.log("surgjax")

});

$(document).on('click', '.bills-patient', function(){
  console.log("bills")
  var hospital_id = $(this).attr("hospital_id")
  var patient_id = $(this).attr("patient_id")
  $.ajax({
    type: 'PATCH',
    url: '/hospitals/' + hospital_id + '/patients/' + patient_id + '/patient_billing',
    // dataType: 'script'
  });
  console.log("billsjax")
});





$(document).on('click', '.leave-patient', function(){
  console.log("leave")
  var hospital_id = $(this).attr("hospital_id")
  var patient_id = $(this).attr("patient_id")
  $.ajax({
    type: 'PATCH',
    url: '/hospitals/' + hospital_id + '/patients/' + patient_id + '/leaving_hospital',
    // dataType: 'script'
  });
  console.log("leavjax")

});
































