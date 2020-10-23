class SystemsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_alteration
  before_action :set_system, only: [:show, :edit, :update, :destroy]
  include SystemsHelper
  # GET /systems
  def index
    @pagy, @systems = pagy(System.where(alteration_id: params[:alteration_id]).sort_by_params(params[:sort], sort_direction))

    # We explicitly load the records to avoid triggering multiple DB calls in the views when checking if records exist and iterating over them.
    # Calling @systems.any? in the view will use the loaded records to check existence instead of making an extra DB call.
    @systems.load
  end

  # GET /systems/1
  def show
  end

  # GET /systems/new
  def new
    @system = @alteration.systems.build
  end

  # GET /systems/1/edit
  def edit
  end

  # POST /systems
  def create
    @system = @alteration.systems.build(system_params)

    @system.altered_heating_component_list = params[:altered_heating_component_list]
    @system.altered_cooling_component_list = params[:altered_cooling_component_list]
    if @system.save
      determine_system_services_needed
      create_system_services_needed
      redirect_to alteration_path(@alteration), notice: "System was successfully created."
    else
      render :new
    end
  end

  # PATCH/PUT /systems/1
  def update
    @system.altered_heating_component_list = params[:altered_heating_component_list]
    @system.altered_cooling_component_list = params[:altered_cooling_component_list]
    if @system.update(system_params)
      determine_system_services_needed
      update_system_services_needed
      redirect_to alteration_path(@alteration), notice: "System was successfully updated."
    else
      render :edit
    end
  end

  # DELETE /systems/1
  def destroy
    @system.destroy
    redirect_to alteration_path(@alteration), notice: "System was successfully destroyed."
  end


  private

  # Use callbacks to share common setup or constraints between actions.
  def set_alteration
    @alteration = Alteration.find(params[:alteration_id])
    @heating_component_list = ["All new heating components", "No heating component altered", "HP Compressor", "Gas furnace AHU", "Packaged Gas Furnace", "HP Indoor Coil", "HP Refrigerant lineset", "Boiler", "Heating Fancoil AHU", "Dual Fuel HP + GasFurnace", "Gas wall furnace", "HP Outdoor condensing unit", "HP TXV or EXV"]
    @cooling_component_list = ["All new cooling components", "No cooling component altered", "Fancoil AHU", "Outdoor condensing unit", "Refrigerant lineset", "Compressor", "Indoor coil", "Outdoor package unit", "TXV or EXV" ]
  end
  def set_system
    @system = System.find(params[:id])
  end

  # Only allow a trusted parameter "white list" through.
  def system_params
    params.require(:system).permit(:alteration_id, :name, :area_served, :cfa_served, :ducted_system, :new_refrigerant_components, :installing_40_ft_ducts, :new_ducts_installed, :installing_new_components, :altered_heating_component_list, :altered_cooling_component_list,:entirely_new_system, :heating_type_id,:heating_efficiency_type,:heating_efficiency_value, :cooling_type_id, :cooling_efficiency_type, :cooling_efficiency_value)
  end
end
