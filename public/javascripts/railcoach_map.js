function create_address_map(address, target_id) {
  var organization_map, organization_marker;
  var geocoder = new google.maps.Geocoder();
  geocoder.geocode( { 'address': address}, function(results, status) {
    if (status == google.maps.GeocoderStatus.OK) {
      var myOptions = {
        zoom: 8,
        center: results[0].geometry.location,
        mapTypeId: google.maps.MapTypeId.ROADMAP
      };

      organization_map = new google.maps.Map(document.getElementById(target_id), myOptions);
      organization_marker = new google.maps.Marker({
        map: organization_map,
        position: results[0].geometry.location
      });
    }
  });
}