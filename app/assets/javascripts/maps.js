$(document).on('ready page:load', function() {
  var canvas = $('#map');

  console.log(canvas);

  var map = new google.maps.Map(canvas[0], {
    center: { lat: 43.647285, lng: -79.387076 },
    zoom: 12
  });
});