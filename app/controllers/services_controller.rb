class ServicesController < ApplicationController
  before_action :set_service, only: [:show, :edit, :update, :destroy]

  # GET /services
  def index
    @pagy, @services = pagy(Service.sort_by_params(params[:sort], sort_direction))

    # We explicitly load the records to avoid triggering multiple DB calls in the views when checking if records exist and iterating over them.
    # Calling @services.any? in the view will use the loaded records to check existence instead of making an extra DB call.
    @services.load
  end

  # GET /services/1
  def show
  end

  # GET /services/new
  def new
    @service = Service.new
  end

  # GET /services/1/edit
  def edit
  end

  # POST /services
  def create
    @service = Service.new(service_params)

    if @service.save
      redirect_to @service, notice: "Service was successfully created."
    else
      render :new
    end
  end

  # PATCH/PUT /services/1
  def update
    if @service.update(service_params)
      redirect_to @service, notice: "Service was successfully updated."
    else
      render :edit
    end
  end

  # DELETE /services/1
  def destroy
    @service.destroy
    redirect_to services_url, notice: "Service was successfully destroyed."
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_service
    @service = Service.find(params[:id])
  end

  # Only allow a trusted parameter "white list" through.
  def service_params
    params.require(:service).permit(:name, :duration, :price, :active)
  end
end
