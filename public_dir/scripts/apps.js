$(document).ready(function(){

$(".want").fadeIn(1500);
// $(".derphoto").fadeIn(1500);
// $(".logophoto").delay(1000).fadeIn(1500);
// $(".buttonbar").delay(1000).fadeIn(1500);

$(".catdrop").click(function() {
  $(".itemform").slideDown(1000);
});

$('.catdrop').on('click', function(event) {

  var categoryText = $(this).children('a').data('catid');
  console.log(categoryText);

  $('#category-hidden').prop("value", categoryText);

});


});
