import { Controller} from "stimulus"

export default class extends Controller {
  static targets = ["field", "map", "latitude", "longitude", "postal_code", "city", "climate_zone", "appointment"]

  connect() {
    if (typeof (google) != "undefined"){
      this.initializeMap()
    }
    console.log("Hello, Stimulus!", this.element)
  }

  initializeMap() {
    this.map()
    this.marker()
    this.autocomplete()
    console.log('init Map')
  }

  map() {
    if(this._map == undefined) {
      this._map = new google.maps.Map(this.mapTarget, {
        center: new google.maps.LatLng(
          this.latitudeTarget.value || 39.5,
          this.longitudeTarget.value || -98.35
        ),
        zoom: (this.latitudeTarget.value == null ? 4 : 17),
        mapId: '7ba78fce9a2bd4e9'
      })
    }
    return this._map
  }

  marker() {
    if (this._marker == undefined) {
      this._marker = new google.maps.Marker({
        map: this.map(),
        animation: google.maps.Animation.DROP,
        anchorPoint: new google.maps.Point(0,0),
        draggable: true
      })
      this._marker.addListener('drag', this.markerDrag.bind(this))
      this._marker.addListener('dragend', this.markerDragEnd.bind(this))
      this._marker.addListener('click', this.markerClick.bind(this))
      let mapLocation = {
        lat: parseFloat(this.latitudeTarget.value),
        lng: parseFloat(this.longitudeTarget.value)
      }
      this._marker.setPosition(mapLocation)
      this._marker.setVisible(true)
    }

    return this._marker
  }

  markerClick(){
    var infowindow = new google.maps.InfoWindow();
    infowindow.setContent("Marker Test");
    infowindow.open(this.map(), this.marker());
  }
  markerDrag(){
    // when marker is dragged update input values
    var latlng = this.marker().getPosition();
    var newlat=(Math.round(latlng.lat()*1000000))/1000000;
    var newlng=(Math.round(latlng.lng()*1000000))/1000000;
    this.latitudeTarget.value = newlat;
    this.longitudeTarget.value = newlng;
  }

  markerDragEnd(){
    // When drag ends, center (pan) the map on the marker position
    this.map().panTo(this.marker().getPosition())   
  }

  autocomplete() {
    if (this._autocomplete == undefined) {
      this._autocomplete = new google.maps.places.Autocomplete(this.fieldTarget)
      this._autocomplete.bindTo('bounds', this.map())
      this._autocomplete.setFields(['address_components', 'geometry', 'icon', 'name'])
      this._autocomplete.addListener('place_changed', this.locationChanged.bind(this))
    }
    return this._autocomplete
  }

  locationChanged() {
    let place = this.autocomplete().getPlace()

    if (!place.geometry) {
      // User entered the name of a Place that was not suggested and
      // pressed the Enter key, or the Place Details request failed.
      window.alert("No details available for input: '" + place.name + "'");
      return;
    }

    if (place.geometry.viewport) {
      this.map().fitBounds(place.geometry.viewport)
    } else {
      this.map().setCenter(place.geometry.location)
      this.map.setZoom(6)
    }
    this.marker().setPosition(place.geometry.location)
    this.marker().setVisible(true)

    this.latitudeTarget.value = place.geometry.location.lat()
    this.longitudeTarget.value = place.geometry.location.lng()
    
    //this.postal_codeTarget.value = "zipcode"
    // place = autocomplete.getPlace();
    for (var i = 0; i < place.address_components.length; i++) {
      for (var j = 0; j < place.address_components[i].types.length; j++) {
        if (place.address_components[i].types[j] == "postal_code") {
          this.postal_codeTarget.value = place.address_components[i].long_name;

        }
        if (place.address_components[i].types[j] == "locality") {
          this.cityTarget.value = place.address_components[i].long_name;
          
        }
      }
    }
  }

  preventSubmit(e) {
    if (e.key == "Enter") { e.preventDefault() }
  }

  
}