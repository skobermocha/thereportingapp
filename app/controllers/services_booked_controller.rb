class ServicesBookedController < ApplicationController
  before_action :authenticate_user!
  before_action :set_appointment
  before_action :set_service_booked, only: [:show, :edit, :update, :destroy]

  # GET /services_bookeds
  def index
    @pagy, @services_booked = pagy(ServiceBooked.where(appointment_id: params[:appointment_id]).sort_by_params(params[:sort], sort_direction))

    # We explicitly load the records to avoid triggering multiple DB calls in the views when checking if records exist and iterating over them.
    # Calling @services_bookeds.any? in the view will use the loaded records to check existence instead of making an extra DB call.
    @services_booked.load
  end

  # GET /services_bookeds/1
  def show
  end

  # GET /services_bookeds/new
  def new
    @service_booked = @appointment.services_booked.build
  end

  # GET /services_bookeds/1/edit
  def edit
  end

  # POST /services_bookeds
  def create
    @service_booked = @appointment.services_booked.build(service_booked_params)

    if @service_booked.save
      redirect_to appointment_services_booked_path(@appointment), notice: "Services booked was successfully created."
    else
      render :new
    end
  end

  # PATCH/PUT /services_bookeds/1
  def update
    if @service_booked.update(service_booked_params)
      redirect_to appointment_services_booked_path(@appointment), notice: "Services booked was successfully updated."
    else
      render :edit
    end
  end

  # DELETE /services_bookeds/1
  def destroy
    @service_booked.destroy
    redirect_to appointment_services_booked_path(@appointment), notice: "Services booked was successfully destroyed."
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_appointment
    @appointment = Appointment.find(params[:appointment_id])
  end

  def set_service_booked
    @service_booked = ServiceBooked.find(params[:id])
  end

  # Only allow a trusted parameter "white list" through.
  def service_booked_params
    params.require(:service_booked).permit(:appointment_id, :system_id, :service_id, :price, :status)
  end
end
