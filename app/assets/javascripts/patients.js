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
  hospital_id = $(".hospital-id").val()
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
  var patient_id = $(this).attr("patient_id")
  $.ajax({
    type: 'PATCH',
    url: '/hospitals/' + hospital_id + '/patients/' + patient_id + '/patient_waiting',
    dataType: 'script' 
  });

});

$(document).on('click', '.check-up-patient', function(){
  console.log("check")
  var patient_id = $(this).attr("patient_id")
  $.ajax({
    type: 'PATCH',
    url: '/hospitals/' + hospital_id + '/patients/' + patient_id + '/patient_checking_up',
    dataType: 'script'
  });
});

$(document).on('click', '.x-ray-patient', function(){
  console.log("xray")
  var patient_id = $(this).attr("patient_id")
  $.ajax({
    type: 'PATCH',
    url: '/hospitals/' + hospital_id + '/patients/' + 
    patient_id + '/patient_x_raying',
    dataType: 'script'
  });

});

$(document).on('click', '.surgery-patient', function(){
  console.log("surgery")
  var patient_id = $(this).attr("patient_id")
  $.ajax({
    type: 'PATCH',
    url: '/hospitals/' + hospital_id + '/patients/' + patient_id + '/patient_surged',
    dataType: 'script'
  });

});

$(document).on('click', '.bills-patient', function(){
  console.log("bills")
  var patient_id = $(this).attr("patient_id")
  $.ajax({
    type: 'PATCH',
    url: '/hospitals/' + hospital_id + '/patients/' + patient_id + '/patient_billing',
    dataType: 'script'
  });
});

$(document).on('click', '.leave-patient', function(){
  console.log("leave")
  var patient_id = $(this).attr("patient_id")
  $.ajax({
    type: 'PATCH',
    url: '/hospitals/' + hospital_id + '/patients/' + patient_id + '/patient_billing',
    dataType: 'script'
  });

});

// $(document).on('click', 'workflow-patient', function() {
//   console.log("WORK");
//   hospital_id = $(".hospital-id").val()
//   var workflow = $(".patient-workflow").val()
//   $.ajax({
//     type: 'PATCH',
//     url: '/hospitals/' + hospital_id + '/patient/workflow_states',
//     dataType: 'script'
//     data:{workflow_state : workflow_state}
// });
//     console.log(kava)
//     console.log(hospital_id);
})  































