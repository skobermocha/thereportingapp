module SystemsHelper
	def determine_system_services_needed
	    # Logic for determining what @system.services_needed need to be created.
	    @zone = @alteration.climate_zone

	    #if all new system is check, ingore other inputs.
	    if @system.entirely_new_system  then
	      #determine if RCM is required for Climate Zone
	      if [1, 3, 4, 5, 6, 7, 16].include? @zone.to_i then
	        @rcm_required = false
	      else
	        @rcm_required = true
	      end
	      #determine if duct work is installed.
	      if @system.ducted_system then
	      	#system has ducts, need to do verifification
	      	@duct_test_required = true
	      	@duct_status = "Entirely New Duct System"
	      	@airflow_required = true
	      	@fanwatt_required = true
	      else
	      	#system does not have ducts, no verification needed.
	      	@duct_test_required = false
	      	@duct_status = "No Ducts"
	      	@airflow_required = false
	      	@fanwatt_required = false
	      end
	    else
	      #system is not all new, need to determine scope of work.
	      #check duct system status
	      if @system.ducted_system then
	        #system has duct work, check status now.
	        if @system.installing_40_ft_ducts then
	          #more than 40ft of ducting was installed, need to check if all duct work was new.
	          if @system.new_ducts_installed then
	            #all duct work was new. Trigger as all new ducts.
	            @duct_status = "Entirely New Duct System"
	            @duct_test_required = true
	          else
	            #more than 40 installed, but it is not all new. Trigger as existing ducts test.
	            @duct_status = "Extension of existing duct system"
	            @duct_test_required = true
	          end
	        else
	          #system has duct work, but less than 40ft is new. Does not trigger duct alteration.
	          @duct_status = "No Alteration Performed"
	          @duct_test_required = false
	        end
	      else
	        #system does not have duct work, no need to check status.
	        @duct_status = "No Alteration Performed"
	        @duct_test_required = false
	      end

	      #determine which components are new
	      if @system.installing_new_components or @system.new_refrigerant_components then
	        #check which heating components are new
	        #collect Heating System Type (select field)
	        #collect Altered Heating Components (check boxes)
	        
	        #collection Heating Efficiecy Type (select field, AFUE, HSPF, COP)
	        #collection Heating min efficiency value (0.80, 8.0, blank)

	        #check which cooling components are new
	        #collect Cooling System Type (select field)
	        #collect Altered Cooling Components (check boxes)
	        #collection Cooling Efficiecy Type (select field, SEER, EER, CEER)
	        #collection Cooling min efficiency value (14)

	        #determine if RCM is required for Climate Zone
	        if [1, 3, 4, 5, 6, 7, 16].include? @zone.to_i then
	          @rcm_required = false
	        else
	          @rcm_required = true
	        end
	      end
	    end
	   	puts "DT = " + @duct_test_required.to_s + " AF = " + @airflow_required.to_s + " FW = " + @fanwatt_required.to_s + " RCM = " + @rcm_required.to_s
    
  	end

  	def create_system_services_needed
		if @duct_test_required
			@service_needed = @system.services_needed.build
			@service_needed.service_id = Service.where(name:"Duct Leakage Test").first.id
			if @duct_status == "Entirely New Duct System"
				@service_needed.target = "0.05"
			else
				@service_needed.target = "0.15"
			end
			@service_needed.status = "To be scheduled"
			@service_needed.save
		end
		if @airflow_required
			@service_needed = @system.services_needed.build
			@service_needed.service_id = Service.where(name:"Airflow").first.id
			if @duct_status = "No Alteration Performed"
  				@service_needed.target = "300"
  			else
  				@service_needed.target = "350"
  			end
			@service_needed.status = "To be scheduled"
			@service_needed.save
		end
		if @fanwatt_required
			@service_needed = @system.services_needed.build
			@service_needed.service_id = Service.where(name:"Fan Watt").first.id
			if @system.heating_type_id = 1
				@service_needed.target = "0.45"
			else
				@service_needed.target = "0.58"
			end
			@service_needed.status = "To be scheduled"
			@service_needed.save
		end
		if @rcm_required
			@service_needed = @system.services_needed.build
			@service_needed.service_id = Service.where(name:"Refrigerant Charge").first.id
			@service_needed.status = "To be scheduled"
			@service_needed.save
		end
  	end

  	def update_system_services_needed
  		#make sure entry for system existing first
  		puts "System Services Count = " + @system.services_needed.count.to_s
  		if @system.services_needed.count > 0 
	  		@system.services_needed.each do |service|
		  		if service.service_id == 1 && Service.find(service.service_id).name == "Duct Leakage Test"
			  		#update entry
			  		if @duct_test_required
			  			if @duct_status == "Entirely New Duct System"
			  				service.target = "0.05"
			  			else
			  				service.target = "0.15"
			  			end
			  			service.status = "To be scheduled" unless service.status.present?
			  			service.save
			  			@duct_test_required = false
			  		else
			  			#destroy entry
			  			service.destroy
			  		end
			  	end

				if service.service_id == 3 && Service.find(service.service_id).name == "Airflow"
			  		#update entry
			  		if @airflow_required
			  			if @duct_status = "No Alteration Performed"
			  				service.target = "300"
			  			else
			  				service.target = "350"
			  			end
			  			service.status = "To be scheduled" unless service.status.present?
			  			service.save
			  			@airflow_required = false
			  		else
			  			#destroy entry
			  			service.destroy
			  		end
		  		end

		  		if service.service_id == 4 && Service.find(service.service_id).name == "Fan Watt"
			  		#update entry
			  		if @fanwatt_required
			  			if @system.heating_type_id = 1
			  				service.target = "0.45"
			  			else
			  				service.target = "0.58"
			  			end
			  			service.status = "To be scheduled" unless service.status.present?
			  			service.save
			  			@fanwatt_required = false
			  		else
			  			#destroy entry
			  			service.destroy
			  		end
			  	end

	  			if service.service_id == 2 && Service.find(service.service_id).name == "Refrigerant Charge"
			  		if @rcm_required
			  			service.status = "To be scheduled" unless service.status.present?
			  			service.save
			  			@rcm_required = false
			  		else
			  			#destroy entry
			  			service.destroy
			  		end
			  	end
			end
  		end
  		create_system_services_needed
  	end

end
