// ./controllers/flatpickr_controller.js
import { Controller } from "stimulus"
// import stimulus-flatpickr wrapper controller to extend it
import Flatpickr from 'stimulus-flatpickr'

// import a theme (could be in your main CSS entry too...)
import 'flatpickr/dist/themes/airbnb.css'

// create a new Stimulus controller by extending stimulus-flatpickr wrapper controller
export default class extends Flatpickr {
	update_end_time(event) {
    	const start_calendar = document.querySelector("#appointment_start_time")._flatpickr;
		const end_calendar = document.querySelector("#appointment_end_time")._flatpickr;  // flatpickr
    	var duration = document.getElementById("appointment_duration").value;
    	end_calendar.setDate(start_calendar.selectedDates[0]);
    	var d = end_calendar.selectedDates[0].setHours(end_calendar.selectedDates[0].getHours() + parseFloat(duration));
    	d = new Date(d);
    	console.log('the callback returns ', d );
    	end_calendar.setDate(d);

  	}

  	
}