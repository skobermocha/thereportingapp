	function updateHeatEfficencyValue() {
	  // Get the checkbox
	  var efficiencyType = document.getElementById("system_heating_efficiency_type");
	  var efficiencyValue = document.getElementById("system_heating_efficiency_value");

		if (efficiencyType.value == 'AFUE'){
		    efficiencyValue.value = '0.80';
		}
		if (efficiencyType.value == 'COP'){
		    efficiencyValue.value = '';
		}
		if (efficiencyType.value == 'HSPF'){
		    efficiencyValue.value = '8.0';
		}
	  
	}
	function updateCoolEfficencyValue() {
	  // Get the checkbox
	  var efficiencyType = document.getElementById("system_cooling_efficiency_type");
	  var efficiencyValue = document.getElementById("system_cooling_efficiency_value");

		if (efficiencyType.value == 'SEER'){
		    efficiencyValue.value = '14.0';
		}
		if (efficiencyType.value == 'EER'){
		    efficiencyValue.value = '';
		}
		if (efficiencyType.value == 'CEER'){
		    efficiencyValue.value = '';
		}
	  
	}
	function ductedSystem() {
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

	  	if (checkBox.checked == true){
			heating.checked = true;
			cooling.checked = true;
		} else {
		    heating.checked = false;
		    cooling.checked = false;
		}
		updateHeatingBoxes();
		updateCoolingBoxes();
	}
	function updateHeatingBoxes(elementId){
		var heatingBoxes = document.getElementsByName("altered_heating_component_list[]");
		var i;
		var checkBox = document.getElementById(elementId);

		if (elementId == "All new heating components" || elementId == "No heating component altered"){
			if (checkBox.checked == true){
				for (i = 0; i < heatingBoxes.length; i++) {
					
				    if (heatingBoxes[i].id != elementId){
				    	heatingBoxes[i].checked = false;
				    	heatingBoxes[i].disabled = true;
				    }
					  
				}
			}else{
				updateHeatingType();
			}
		}
	}
	function updateHeatingType(){
		var heatingType = getSelectedText("system_heating_type_id");
		var heatingBoxes = document.getElementsByName("altered_heating_component_list[]");
		var arrayHP = ['HP', 'Heat Pump', 'heat pump']
		var hpType = contains(heatingType, arrayHP);
		switch (hpType){
			case true:
				for (i = 0; i < heatingBoxes.length; i++) {
					if (heatingBoxes[i].id != "All new heating components" || heatingBoxes[i].id != "No heating component altered"){
					    if (heatingBoxes[i].id.includes("HP")){
					    	heatingBoxes[i].disabled = false;
					    }else{
					    	heatingBoxes[i].checked = false;
					    	heatingBoxes[i].disabled = true;
						}
					}
				}
				document.getElementById("All new heating components").disabled = false;
				document.getElementById("No heating component altered").disabled = false;
				document.getElementById("system_heating_efficiency_type").value = 'HSPF';
				updateHeatEfficencyValue();
			break;
			default:
				for (i = 0; i < heatingBoxes.length; i++) {
					if (heatingBoxes[i].id != "All new heating components" || heatingBoxes[i].id != "No heating component altered"){
					    if (heatingBoxes[i].id.includes("HP")){
					    	heatingBoxes[i].checked = false;
					    	heatingBoxes[i].disabled = true;
					    }else{
					    	heatingBoxes[i].disabled = false;
						}
					}
				}
				document.getElementById("system_heating_efficiency_type").selectedIndex = 'AFUE';
				updateHeatEfficencyValue();
		}

	}
	function updateCoolingBoxes(){
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
	window.updateHeatEfficencyValue = updateHeatEfficencyValue;
	window.updateCoolEfficencyValue = updateCoolEfficencyValue;
	window.ductedSystem = ductedSystem;
	window.AllNewSystem = AllNewSystem;
	window.updateHeatingBoxes = updateHeatingBoxes;
	window.updateHeatingType = updateHeatingType;


	function getSelectedText(elementId) {
	    var element = document.getElementById(elementId);

	    if (element.selectedIndex == -1)
	        return null;

	    return element.options[element.selectedIndex].text;
	}
	function contains(target, pattern){
	    var value = 0;
	    pattern.forEach(function(word){
	      value = value + target.includes(word);
	    });
	    return (value === 1)
	}