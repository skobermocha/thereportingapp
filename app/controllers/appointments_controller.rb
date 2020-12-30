class AppointmentsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_appointment, only: [:show, :edit, :update, :destroy]

  # GET /appointments
  def index
    #@shared_alterations = AlterationUser.where(account_id: current_account.id)
    #@account_alterations = Alteration.where(owner_id: current_account.id)
    @alterations = current_account.alterations
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
    @duration = 0
    @appointment = Appointment.new
    @alteration.services_needed.count.times {@appointment.services_booked.build}
    #@booked = @appointment.services_needed.joins(:services_booked).where(system_id:@appointment.services_booked.pluck(:system_id))
    @need_to_book = @alteration.services_needed
  end

  # GET /appointments/1/edit
  def edit
    @needed = @alteration.services_needed
    puts "needed:"
    @needed.each { |link| p link }
    @booked = @appointment.services_booked.pluck(:system_id, :service_id)
    puts "booked:"
    @booked.each { |link| p link }
    @need_to_book = @needed.to_a
    @booked.each_with_index do |b, index|
      puts "index:" + @booked[index][0].to_s
        @need_to_book.delete_if {|need| need.system_id == @booked[index][0] && need.service_id == @booked[index][1]}
    end
    puts "Need-to-book:"
    @need_to_book.each { |link| p link }
    @need_to_book.each do |service|
      @appointment.services_booked.build(service_id: service.service_id, system_id: service.system_id, status: service.status)
    end
    #@appointment.services_booked.sort_by { |x| [x.system_id, x.service_id] }
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
    @alteration = Alteration.find (@appointment.alteration_id)
  end

  # Only allow a trusted parameter "white list" through.
  def appointment_params
    params.require(:appointment).permit(:alteration_id, :user_id, :user_created_id, :contact_name, :contact_phone, :start_time, :end_time, services_booked_attributes: [:id, :status, :appointment_id, :system_id, :service_id, :_destroy])
  end
end
