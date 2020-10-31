class AppointmentsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_appointment, only: [:show, :edit, :update, :destroy]

  # GET /appointments
  def index
    @shared_alterations = AlterationUser.where(account_id: current_account.id)
    @account_alterations = Alteration.where(owner_id: current_account.id)
    @alterations = @account_alterations.joins(:alteration_users).merge(@shared_alterations)
    @appointments = Appointment.where(alteration_id: @alterations)
    @pagy, @appointments = pagy(@appointments.sort_by_params(params[:sort], sort_direction))

    # We explicitly load the records to avoid triggering multiple DB calls in the views when checking if records exist and iterating over them.
    # Calling @appointments.any? in the view will use the loaded records to check existence instead of making an extra DB call.
    @appointments.load
  end

  # GET /appointments/1
  def show
  end

  # GET /appointments/new
  def new
    @alteration = Alteration.find (params[:alteration_id])
    if @alteration.systems.any?
      @duration = 0
      @appointment = Appointment.new
    else
      redirect_to @alteration, notice: "The alteration needs a system defined before you can schedule an appointment."
    end

  end

  # GET /appointments/1/edit
  def edit
  end

  # POST /appointments
  def create
    @appointment = Appointment.new(appointment_params)

    if @appointment.save
      redirect_to @appointment, notice: "Appointment was successfully created."
    else
      render :new
    end
  end

  # PATCH/PUT /appointments/1
  def update
    if @appointment.update(appointment_params)
      redirect_to @appointment, notice: "Appointment was successfully updated."
    else
      render :edit
    end
  end

  # DELETE /appointments/1
  def destroy
    @appointment.destroy
    redirect_to appointments_url, notice: "Appointment was successfully destroyed."
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_appointment
    @appointment = Appointment.find(params[:id])
  end

  # Only allow a trusted parameter "white list" through.
  def appointment_params
    params.require(:appointment).permit(:alteration_id, :user_id, :user_created_id, :contact_name, :contact_phone, :start_time, :end_time)
  end
end
