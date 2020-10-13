class SystemsController < ApplicationController
  before_action :set_alteration
  before_action :set_system, only: [:show, :edit, :update, :destroy]

  # GET /systems
  def index
    @pagy, @systems = pagy(System.sort_by_params(params[:sort], sort_direction))

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

    if @system.save
      redirect_to alteration_system_path(@alteration, @system), notice: "System was successfully created."
    else
      render :new
    end
  end

  # PATCH/PUT /systems/1
  def update
    if @system.update(system_params)
      redirect_to alteration_system_path(@alteration, @system), notice: "System was successfully updated."
    else
      render :edit
    end
  end

  # DELETE /systems/1
  def destroy
    @system.destroy
    redirect_to alteration_systems_path(@alteration), notice: "System was successfully destroyed."
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_alteration
    @alteration = Alteration.find(params[:alteration_id])
  end
  def set_system
    @system = System.find(params[:id])
  end

  # Only allow a trusted parameter "white list" through.
  def system_params
    params.require(:system).permit(:alteration_id, :name)
  end
end
