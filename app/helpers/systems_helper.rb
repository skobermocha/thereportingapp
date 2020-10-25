module SystemsHelper
	def rcm_required?(zone)
		@result = true
		if [1, 3, 4, 5, 6, 7, 16].include? zone.to_i then
	        result = false
	      end
	    puts 'rcm_required= ' + @result.to_s
	    return @result
	end
	def new_cooling_trigger_rcm?()
		@result = false
		@trigger_list = ['All new cooling components', 'Indoor Coil', 'Fancoil AHU', 'Outdoor condensing unit','Outdoor package unit']
		if @system.altered_cooling_component_list.any?{|x| @trigger_list.include?(x)} then
			@result = true
		end
		puts 'new_cooling_trigger_rcm= ' + @result.to_s
		return @result
	end
	def new_heating_trigger_dt?()
		@result = false
		@trigger_list = ['All new heating components', 'Gas furnace AHU', 'Packaged Gas Furnace', 'Indoor Coil', 'Fancoil AHU', 'Dual Fuel HP + GasFurnace', 'Outdoor condensing unit']
		if @system.altered_heating_component_list.any?{|x| @trigger_list.include?(x)} then
			@result = true
		end
		puts 'new_heating_trigger_dt= ' + @result.to_s
		return @result
	end
	def determine_system_services_needed
	    # Logic for determining what @system.services_needed need to be created.
	    #if all new system is check, ingore other inputs.
	    if @system.entirely_new_system  then
	      	#determine if RCM is required for Climate Zone
	    	@rcm_required = rcm_required?(@alteration.climate_zone)
	      	
	      	#determine if duct work is installed.
	      	if @system.ducted_system then
		      	#system has ducts, need to do verifification
		      	@duct_test_required = true
		      	@duct_test_target = 0.05
		      	@airflow_required = true
		      	@airflow_target = 350
		      	@fanwatt_required = true
		      	if @system.heating_type_id == 1
		      		@fanwatt_target = 0.45
		      	else
		      		@fanwatt_target = 0.58
		      	end
	      	else
		      	#system does not have ducts, no verification needed.
		      	@duct_test_required = false
		      	@duct_test_target = 'n/a'
		      	@airflow_required = false
		      	@airflow_target = 'n/a'
		      	@fanwatt_required = false
		      	@fanwatt_target = 'n/a'
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
		            	@duct_test_required = true
				      	@duct_test_target = 0.05
				      	@airflow_required = true
				      	@airflow_target = 350
				      	@fanwatt_required = true
				      	if @system.heating_type_id == 1
				      		@fanwatt_target = 0.45
				      	else
				      		@fanwatt_target = 0.58
				      	end
					    #are new cooling components include and trigger rcm
					    if new_cooling_trigger_rcm?() then
					    	@rcm_required = rcm_required?(@alteration.climate_zone)
					    end
		          	else
		            	#more than 40 installed, but it is not all new. Trigger as existing ducts test.
		            	@duct_test_required = true
		            	@duct_test_target = 0.15
					    @fanwatt_required = false
					    @fanwatt_target = 'n/a'
					    #are new cooling components include and trigger rcm
					    if new_cooling_trigger_rcm?() then
					    	if @rcm_required = rcm_required?(@alteration.climate_zone)
					    		@airflow_required = false
		      					@airflow_target = 300
		      				else
		      					@airflow_required = false
		      					@airflow_target = 'n/a'	
		      				end
		      			else
		      				@rcm_required = false
		      				@airflow_required = false
		      				@airflow_target = 'n/a'
					    end
		          	end
		        else
		          	#system has duct work, but less than 40ft is new.
		          	#check what components are new. certain ones trigger duct test and/or RCM still
		          	#are new cooling components include and trigger rcm
				    if new_cooling_trigger_rcm?() then
				    	@duct_test_required = true
		            	@duct_test_target = 0.15
					    @fanwatt_required = false
					    @fanwatt_target = 'n/a'
				    	if @rcm_required = rcm_required?(@alteration.climate_zone)
				    		@airflow_required = true
	      					@airflow_target = 300
	      				else
	      					@airflow_required = false
	      					@airflow_target = 'n/a'	
	      				end
	      			else
	      				if new_heating_trigger_dt?() then
		      				@duct_test_required = true
			            	@duct_test_target = 0.15
						    @fanwatt_required = false
						    @fanwatt_target = 'n/a'
		      				@rcm_required = false
		      				@airflow_required = false
		      				@airflow_target = 'n/a'
			          	else
			          		@duct_test_required = false
			            	@duct_test_target = 'n/a'
			          		@rcm_required = false
						    @airflow_required = false
						    @airflow_target = 'n/a'
			          		@fanwatt_required = false
			          		@fanwatt_target = 'n/a'
			          	end
		        	end
	        	end
	      	end
	    end
	   	puts "DT = " + @duct_test_required.to_s + " AF = " + @airflow_required.to_s + " FW = " + @fanwatt_required.to_s + " RCM = " + @rcm_required.to_s
    
  	end

  	def create_system_services_needed
		if @duct_test_required
			@service_needed = @system.services_needed.build
			@service_needed.service_id = Service.where(name:"Duct Leakage Test").first.id
			@service_needed.target = @duct_test_target.to_s
			@service_needed.status = "To be scheduled"
			@service_needed.save
		end
		if @airflow_required
			@service_needed = @system.services_needed.build
			@service_needed.service_id = Service.where(name:"Airflow").first.id
  			@service_needed.target = @airflow_target.to_s
			@service_needed.status = "To be scheduled"
			@service_needed.save
		end
		if @fanwatt_required
			@service_needed = @system.services_needed.build
			@service_needed.service_id = Service.where(name:"Fan Watt").first.id
			@service_needed.target = @fanwatt_target.to_s
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
			  			service.target = @duct_test_target.to_s
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
			  			service.target = @airflow_target.to_s
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
			  			service.target = @fanwatt_target.to_s
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
