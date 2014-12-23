function initialize() {
    var mapOptions = {
	center: { lat: 44.022746, lng: -71.830950},
	zoom: 13,
	mapTypeId: google.maps.MapTypeId.TERRAIN
    };
    var map = new google.maps.Map(document.getElementById('map-canvas'),
				  mapOptions);
}
google.maps.event.addDomListener(window, 'load', initialize);
// alert("Javascript success!")
