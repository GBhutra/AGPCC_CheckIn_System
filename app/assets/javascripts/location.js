function getGeoLocation() {
  if (navigator.geolocation){
  navigator.geolocation.getCurrentPosition(setGeoCookie, showError);
  }
  else {
    alert("Location Services are not supported by your browser. Please contact helpdesk to checkin.")
    var cookie_val = "ERROR Location Services are not supported by your browser. Please contact helpdesk to checkin.";
    document.cookie = "lat_lng=" + escape(cookie_val);
  }
}

function setGeoCookie(position) {
  if (navigator.geolocation){
    var cookie_val = position.coords.latitude + "|" + position.coords.longitude;
    document.cookie = "lat_lng=" + escape(cookie_val);
  }
  else {
    alert("Location Services are not supported by your browser. Please contact helpdesk to checkin.")
    var cookie_val = "ERROR Location Services are not supported by your browser. Please contact helpdesk to checkin.";
    document.cookie = "lat_lng=" + escape(cookie_val);
  }
  
}

function showError(error) {
    switch(error.code) {
        case error.PERMISSION_DENIED:
            var cookie_val = "ERROR In order to check in, Please permit AGPCC APP to use location services ";
            document.cookie = "lat_lng=" + escape(cookie_val);
            alert(cookie_val);
            break;
        case error.POSITION_UNAVAILABLE:
            var cookie_val = "ERROR Please Enable your GPS"
            document.cookie = "lat_lng=" + escape(cookie_val);
            alert(cookie_val);
            break;
        case error.TIMEOUT:
            var cookie_val = "ERROR The request to get user location timed out."
            document.cookie = "lat_lng=" + escape(cookie_val);
            alert(cookie_val);
            break;
        case error.UNKNOWN_ERROR:
            var cookie_val = "ERROR An unknown error occurred."
            document.cookie = "lat_lng=" + escape(cookie_val);
            alert(cookie_val);
            break;
    }
}

function distance(lon1, lat1, lon2, lat2) {
  var R = 6371; // Radius of the earth in km
  var dLat = (lat2-lat1).toRad();  // Javascript functions in radians
  var dLon = (lon2-lon1).toRad(); 
  var a = Math.sin(dLat/2) * Math.sin(dLat/2) +
          Math.cos(lat1.toRad()) * Math.cos(lat2.toRad()) * 
          Math.sin(dLon/2) * Math.sin(dLon/2); 
  var c = 2 * Math.atan2(Math.sqrt(a), Math.sqrt(1-a)); 
  var d = R * c; // Distance in km
  return d;
}

/** Converts numeric degrees to radians */
if (typeof(Number.prototype.toRad) === "undefined") {
  Number.prototype.toRad = function() {
    return this * Math.PI / 180;
  }
}
