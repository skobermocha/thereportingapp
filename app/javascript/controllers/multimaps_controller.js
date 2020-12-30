import { Controller} from "stimulus"

export default class extends Controller {
  static targets = ["map", "appointment", "container"]
  //static values = { appointment: Number, address: String, rater: Number, start: String}

  connect() {
    if (typeof (google) != "undefined"){
      this.initializeMultiMap()
    }
    console.log("Hello, Stimulus!", this.element)
  }

  initializeMultiMap() {
    this.map()
    this.multiMarker()
    console.log('init MultiMap')
  }

  map() {
    if(this._map == undefined) {
      this._map = new google.maps.Map(this.mapTarget, {
        center: new google.maps.LatLng(36.7783,119.4179),
        zoom: (4)
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
  var markers = this.getLocations();
  var infoWindow = new google.maps.InfoWindow(), marker, i;
    
    // Loop through our array of markers & place each one on the map  
    for( i = 0; i < markers.length; i++ ) {
        var position = new google.maps.LatLng(markers[i][1], markers[i][2]);
        bounds.extend(position);
        marker = new google.maps.Marker({
            position: position,
            map: this.map(),
            title: markers[i][0]
        });
        
        // Allow each marker to have an info window    
        google.maps.event.addListener(marker, 'click', (function(marker, i) {
            return function() {
                infoWindow.setContent(markers[i][0]);
                infoWindow.open(map, marker);
            }
        })(marker, i));

        // Automatically center the map fitting all markers on the screen
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
      console.log ([this.appointmentTargets[i].dataset.id,this.appointmentTargets[i].dataset.latitude, this.appointmentTargets[i].dataset.longitude])
      locations.push([this.appointmentTargets[i].dataset.id,this.appointmentTargets[i].dataset.latitude, this.appointmentTargets[i].dataset.longitude])
    }
    return locations
  }


}