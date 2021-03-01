import { Controller} from "stimulus"
import MarkerClusterer from '@googlemaps/markerclustererplus';
var markers = [];
var markerCluster
export default class extends Controller {
  static targets = ["map", "appointment", "query", "container"]

  connect() {
    if (typeof (google) != "undefined"){
      this.initializeMultiMap()
    }
    console.log("multiMap connected")
  }

  initializeMultiMap() {
    this.map()
    this.multiMarker()
    
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

  preventSubmit(e) {
    if (e.key == "Enter") { e.preventDefault() }
  }

  multiMarker(){
  // Display multiple markers on a map
  if(markers.length > 0) { this.deleteMarkers()}
  var bounds = new google.maps.LatLngBounds();
  var places = this.getLocations();
  var i
    
    // Loop through our array of places & place each one on the map  
    for( i = 0; i < places.length; i++ ) {
        //console.log("Places: " + places[i][1] + ", "+ places[i][2])
        var position = new google.maps.LatLng(places[i][1], places[i][2]);
        bounds.extend(position);
        this.addMarker(places[i]);   
        // Automatically center the map fitting all places on the screen
        this.map().fitBounds(bounds);
    }
    markerCluster = new MarkerClusterer(this.map(), markers, {
      imagePath:
        "https://developers.google.com/maps/documentation/javascript/examples/markerclusterer/m",
      gridSize: 30
    });
    // Override our map zoom level once our fitBounds function runs (Make sure it only runs once)
    var boundsListener = google.maps.event.addListener((map), 'bounds_changed', function(event) {
        this.setZoom(10);
        google.maps.event.removeListener(boundsListener);
    });

    console.log("markers: "+markers.length)
    this.showMarkers()
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

  submit() {
    const value = this.queryTarget.value
    fetch(`/appointments?query=${value}`, {
      headers: { accept: 'application/json'}
    }).then((response) => response.json())
    .then(data => { 
      console.log(data)
     var appointmentHTML = "";
     var appointmentArray = Object.values(data)
     console.log(appointmentArray)
     appointmentArray.forEach(appointment => {
      appointmentHTML += this.appointmentTemplate(appointment)
    });
     this.containerTarget.innerHTML = appointmentHTML;
     this.multiMarker()
   }); 
    
  }

  appointmentTemplate(appointment) {
      return "<div class='border border-gray-400 rounded p-8 my-8' data-id='"+appointment.id+"' data-latitude='"+appointment.alteration.latitude+"' data-longitude='"+appointment.alteration.longitude+"' data-target='multimaps.appointment'> <h3>Appointment ID # "+appointment.id+" </h3> <p>latitude: "+appointment.alteration.latitude+" </p> <p>longitude: "+appointment.alteration.longitude+" </p> </div>"

  }
  // Adds a marker to the map and push to the array.
  addMarker(location) {
    var position = new google.maps.LatLng(location[1], location[2]);
    const marker = new google.maps.Marker({
      position: position,
      map: this.map(),
    });
    markers.push(marker);
    const infowindow = new google.maps.InfoWindow({
      content: String(location)
    });
    marker.addListener("click", () => {
      infowindow.open(this.map(), marker);
    });
  }
  // Sets the map on all markers in the array.
  setMapOnAll(map) {
    for (let i = 0; i < markers.length; i++) {
      markers[i].setMap(map);
    }

  }
  // Removes the markers from the map, but keeps them in the array.
  clearMarks() {
    this.setMapOnAll(null);
    markerCluster.clearMarkers();
  }

  // Shows any markers currently in the array.
  showMarkers() {
    this.setMapOnAll(this.map());
  }

  // Deletes all markers in the array by removing references to them.
  deleteMarkers() {
    this.clearMarks();
    markers = [];
    console.log("delete marker")
  }
}