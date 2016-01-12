
// Place all the behaviors and hooks related to the matching controller here.
// All this logic will automatically be available in application.js.
[{"featureType":"all","elementType":"labels.text.fill","stylers":[{"saturation":36},{"color":"#000000"},{"lightness":40}]},{"featureType":"all","elementType":"labels.text.stroke","stylers":[{"visibility":"on"},{"color":"#000000"},{"lightness":16}]},{"featureType":"all","elementType":"labels.icon","stylers":[{"visibility":"off"}]},{"featureType":"administrative","elementType":"geometry.fill","stylers":[{"color":"#000000"},{"lightness":20}]},{"featureType":"administrative","elementType":"geometry.stroke","stylers":[{"color":"#000000"},{"lightness":17},{"weight":1.2}]},{"featureType":"landscape","elementType":"geometry","stylers":[{"color":"#000000"},{"lightness":20}]},{"featureType":"poi","elementType":"geometry","stylers":[{"color":"#000000"},{"lightness":21}]},{"featureType":"road.highway","elementType":"geometry.fill","stylers":[{"color":"#000000"},{"lightness":17}]},{"featureType":"road.highway","elementType":"geometry.stroke","stylers":[{"color":"#000000"},{"lightness":29},{"weight":0.2}]},{"featureType":"road.arterial","elementType":"geometry","stylers":[{"color":"#000000"},{"lightness":18}]},{"featureType":"road.local","elementType":"geometry","stylers":[{"color":"#000000"},{"lightness":16}]},{"featureType":"transit","elementType":"geometry","stylers":[{"color":"#000000"},{"lightness":19}]},{"featureType":"water","elementType":"geometry","stylers":[{"color":"#000000"},{"lightness":17}]}]

$(document).on("ready page:load", function(){
  $('#nearby-search').on('click', function(){
    if("geolocation" in navigator) {
      navigator.geolocation.getCurrentPosition(success, error);
    }
  })
})

function success(position) {
  var lat = position.coords.latitude;
  var lon = position.coords.longitude;
  console.log(lat, lon);
  $.ajax({
    url: '/activities',
    method: 'get',
    data: {'latitude': lat, 'longitude': lon},
    dataType: 'html',
    success: function(data) {
      $('#activities').html(data);
    }
  })
}

function error(err) {
  console.log('something went wrong' + err.message);
}


