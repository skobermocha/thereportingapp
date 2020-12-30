import { Controller} from "stimulus"
import MarkerClusterer from '@googlemaps/markerclustererplus';

let markers = [];

export default class extends Controller {
  static targets = ["map", "appointment", "container"]

  connect() {
    if (typeof (google) != "undefined"){
      this.initializeMultiMap()
    }
    console.log("Hello, Stimulus!", this.element)
  }

  initializeMultiMap() {
  this.map()
  this.multiMarker()
  new MarkerClusterer(this.map(), markers, {
    imagePath:
      "https://developers.google.com/maps/documentation/javascript/examples/markerclusterer/m",
    gridSize: 30
  });
    console.log('init MultiMap')
  }

  map() {
    if(this._map == undefined) {
      this._map = new google.maps.Map(this.mapTarget, {
        center: {lat: 36.7783, lng: 119.4179},
        zoom: 4,
        mapId: '7ba78fce9a2bd4e9'
      })
    }
    return this._map
  }

  markerClick(){
    var infowindow = new google.maps.InfoWindow();
    infowindow.setContent("Marker Test");
    infowindow.open(this.map(), this.marker());
  }

  preventSubmit(e) {
    if (e.key == "Enter") { e.preventDefault() }
  }

  multiMarker(){
  // Display multiple markers on a map
  var bounds = new google.maps.LatLngBounds();
  var places = this.getLocations();
  var infoWindow = new google.maps.InfoWindow(), marker, i;
    
    // Loop through our array of places & place each one on the map  
    for( i = 0; i < places.length; i++ ) {
        var position = new google.maps.LatLng(places[i][1], places[i][2]);
        bounds.extend(position);
        marker = new google.maps.Marker({
            position: position,
            map: this.map(),
            title: places[i][0]
        });
        markers.push(marker);

        // Allow each marker to have an info window    
        google.maps.event.addListener(marker, 'click', (function(marker, i) {
            return function() {
                infoWindow.setContent(places[i][0]);
                infoWindow.open(map, marker);
            }
        })(marker, i));

        // Automatically center the map fitting all places on the screen
        this.map().fitBounds(bounds);
    }

    // Override our map zoom level once our fitBounds function runs (Make sure it only runs once)
    var boundsListener = google.maps.event.addListener((map), 'bounds_changed', function(event) {
        this.setZoom(10);
        google.maps.event.removeListener(boundsListener);
    });
  }

  getLocations(){
    var i = 0
    var locations = []
    for ( i = 0; i < this.appointmentTargets.length; i++ ) {
      //console.log ([this.appointmentTargets[i].dataset.id,this.appointmentTargets[i].dataset.latitude, this.appointmentTargets[i].dataset.longitude])
      locations.push([this.appointmentTargets[i].dataset.id,this.appointmentTargets[i].dataset.latitude, this.appointmentTargets[i].dataset.longitude])
    }
    return locations
  }


}