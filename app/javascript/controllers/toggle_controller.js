import { Controller } from "stimulus"
// import stimulus-flatpickr wrapper controller to extend it
import Flatpickr from 'stimulus-flatpickr'

export default class extends Controller {
  static targets = [ "toggleable" ]

  connect() {
    this.toggleClass = this.data.get("class") || "hidden"
  }

  toggle(event) {
    event.preventDefault()

    this.toggleableTargets.forEach( target => {
      target.classList.toggle(this.toggleClass)
    })
  }

  calculate_duration(event){
      var checkboxes = document.getElementsByClassName("service-checkbox");
      var service_durations = document.getElementsByClassName("service-duration");
      
      var appt_duration = 0
    for (var i = 0; i < checkboxes.length; i++) {
      if (checkboxes[i].checked == 1){
        appt_duration = appt_duration + parseFloat(service_durations[i].innerHTML);
      }
    }
    document.getElementById("appointment_duration").value = appt_duration;
    update_end();
  }
}

function update_end() {
      const start_calendar = document.querySelector("#appointment_start_time")._flatpickr;
      const end_calendar = document.querySelector("#appointment_end_time")._flatpickr;
      var start_value = document.getElementById("appointment_start_time");
      if (start_value && start_value.value){
        var duration = document.getElementById("appointment_duration").value;
        end_calendar.setDate(start_calendar.selectedDates[0]);
        var d = end_calendar.selectedDates[0].setHours(end_calendar.selectedDates[0].getHours() + parseFloat(duration));
        d = new Date(d);
        console.log('the callback returns ', d, "duration ", duration);
        end_calendar.setDate(d);
      }
}
