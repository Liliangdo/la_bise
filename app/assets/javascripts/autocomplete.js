$(document).ready(function() {
  var search_city = $('#search_city').get(0);

  if (search_city) {
    var autocomplete = new google.maps.places.Autocomplete(search_city, { types: ['geocode'] });
    google.maps.event.addListener(autocomplete, 'place_changed', onPlaceChanged);
    google.maps.event.addDomListener(search_city, 'keydown', function(e) {
      if (e.keyCode == 13) {
        e.preventDefault(); // Do not submit the form on Enter.
      }
    });
  }
});


function onPlaceChanged() {
  var place = this.getPlace();
  var components = getAddressComponents(place);
  $('#search_city').val(components.city);
}

function getAddressComponents(place) {
  // If you want lat/lng, you can look at:
  // - place.geometry.location.lat()
  // - place.geometry.location.lng()
  var city = null;
  for (var i in place.address_components) {
    var component = place.address_components[i];
    for (var j in component.types) {
      var type = component.types[j];
      if (type == 'locality') {
        city = component.short_name;
      }
    }
  }
  return {
    city: city,
  };
}
