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
      console.log('it worked!' + data);
    }
  })
}

function error(err) {
  console.log('something went wrong' + err.message);
}