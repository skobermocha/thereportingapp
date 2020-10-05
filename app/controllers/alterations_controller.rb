class AlterationsController < ApplicationController
  before_action :set_alteration, only: [:show, :edit, :update, :destroy]

  # GET /alterations
  def index
    @shares = AlterationUser.where(account_id: current_account.id)
    @alterations = Alteration.joins(:alteration_users).merge(@shares)
    @pagy, @alterations = pagy(Alteration.sort_by_params(params[:sort], sort_direction))

    # We explicitly load the records to avoid triggering multiple DB calls in the views when checking if records exist and iterating over them.
    # Calling @alterations.any? in the view will use the loaded records to check existence instead of making an extra DB call.
    @alterations.load
  end

  # GET /alterations/1
  def show
  end

  # GET /alterations/new
  def new
    @alteration = Alteration.new
  end

  # GET /alterations/1/edit
  def edit
  end

  # POST /alterations
  def create
    @alteration = Alteration.new(alteration_params)
    @alteration.owner_id = current_account.id
    if @alteration.save
      @alteration_user = AlterationUser.new
      @alteration_user.alteration_id = @alteration.id
      @alteration_user.account_id = current_account.id
      @alteration_user.save
      redirect_to @alteration, notice: "Alteration was successfully created."
    else
      render :new
    end
  end

  # PATCH/PUT /alterations/1
  def update
    if @alteration.update(alteration_params)
      redirect_to @alteration, notice: "Alteration was successfully updated."
    else
      render :edit
    end
  end

  # DELETE /alterations/1
  def destroy
    @alteration.destroy
    redirect_to alterations_url, notice: "Alteration was successfully destroyed."
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_alteration
    @alteration = Alteration.find(params[:id])
  end

  # Only allow a trusted parameter "white list" through.
  def alteration_params
    params.require(:alteration).permit(:owner_id, :name, :address, :city, :zipcode, :jurisdiction, :permit_number, :ho_name, :ho_phone, :ho_email, :building_type, :dwelling_unit_name, :dwelling_unit_cfa, :climate_zone, :bedroom_count)
  end
end
