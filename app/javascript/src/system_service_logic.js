	function myFunction() {
	  // Get the checkbox
	  var checkBox = document.getElementById("system_ducted_system");
	  // Get the output text
	  var text = document.getElementsByClassName("only-if-ducted");

	  	var i;
		for (i = 0; i < text.length; i++) {
			if (checkBox.checked == true){
			    text[i].disabled = false;
			  } else {
			    text[i].disabled = true;
			    text[i].checked = false;
			  }
		}
	  // If the checkbox is checked, display the output text
	  
	}
	function AllNewSystem() {
	  // Get the checkbox
	  	var checkBox = document.getElementById("system_entirely_new_system");
	  	var heating = document.getElementById("All new heating components");
		var cooling = document.getElementById("All new cooling components");
		var heatingBoxes = document.getElementsByName("altered_heating_component_list[]");
		var coolingBoxes = document.getElementsByName("altered_cooling_component_list[]");
	  // Get the output text
	  			var i;
				for (i = 0; i < heatingBoxes.length; i++) {
					if (checkBox.checked == true){
					    heating.checked = true;
					    if (heatingBoxes[i].id != "All new heating components"){
					    	heatingBoxes[i].checked = false;
					    	heatingBoxes[i].disabled = true;
					    }
					  } else {
					    heating.checked = false;
					    heatingBoxes[i].disabled = false;
					  }
				}
				var i;
				for (i = 0; i < coolingBoxes.length; i++) {
					if (checkBox.checked == true){
					    cooling.checked = true;
					    if (coolingBoxes[i].id != "All new cooling components"){
					    	coolingBoxes[i].checked = false;
					    	coolingBoxes[i].disabled = true;
					    }
					  } else {
					    cooling.checked = false;
					    coolingBoxes[i].disabled = false;
					  }
				}
					  // If the checkbox is checked, display the output text
	  
	}
	window.myFunction = myFunction;
	window.AllNewSystem = AllNewSystem;