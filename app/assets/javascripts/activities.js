$(document).on("ready page:load", function(){
  $('#nearby-search').on('click', function(){
    if("geolocation" in navigator) {
      navigator.geolocation.getCurrentPosition(success, error);
    }
  })
})

function success() {
  console.log('it workd!');
}

function error() {
  console.log('something went wrong');
}