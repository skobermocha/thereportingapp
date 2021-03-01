import { Controller } from "stimulus"

export default class extends Controller {
static targets = ["query", "appointment"]

	connect(){
		console.log("search controller connected")
	}

	submit() {
	    const value = this.queryTarget.value
	    fetch(`/appointments?query=${value}`, {
	      headers: { accept: 'application/json'}
	    }).then((response) => response.text())
	    .then(data => console.log(data))
  	}
}
