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