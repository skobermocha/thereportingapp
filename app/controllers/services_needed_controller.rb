class ServicesNeededController < ApplicationController
  before_action :set_system
  before_action :set_service_needed, only: [:show, :edit, :update, :destroy]

  # GET /services_neededs
  def index
    @pagy, @services_needed = pagy(ServiceNeeded.sort_by_params(params[:sort], sort_direction))

    # We explicitly load the records to avoid triggering multiple DB calls in the views when checking if records exist and iterating over them.
    # Calling @services_neededs.any? in the view will use the loaded records to check existence instead of making an extra DB call.
    @services_needed.load
  end

  # GET /services_neededs/1
  def show
  end

  # GET /services_neededs/new
  def new
    @service_needed = @system.services_needed.build
  end

  # GET /services_neededs/1/edit
  def edit
  end

  # POST /services_neededs
  def create
    @service_needed = @system.services_needed.build(service_needed_params)

    if @service_needed.save
      redirect_to system_services_needed_path(@system), notice: "Services needed was successfully created."
    else
      render :new
    end
  end

  # PATCH/PUT /services_neededs/1
  def update
    if @services_needed.update(service_needed_params)
      redirect_to system_services_needed_path(@system), notice: "Services needed was successfully updated."
    else
      render :edit
    end
  end

  # DELETE /services_neededs/1
  def destroy
    @service_needed.destroy
    redirect_to system_services_needed(@system), notice: "Services needed was successfully destroyed."
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_system
    @system = system.find(params[:system_id])
  end

  def set_service_needed
    @service_needed = ServiceNeeded.find(params[:id])
  end

  # Only allow a trusted parameter "white list" through.
  def service_needed_params
    params.require(:service_needed).permit(:system_id, :service_id, :price, :status)
  end
end
