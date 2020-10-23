class HeatingTypesController < ApplicationController
  before_action :authenticate_user!
  before_action :set_heating_type, only: [:show, :edit, :update, :destroy]

  # GET /heating_types
  def index
    @pagy, @heating_types = pagy(HeatingType.sort_by_params(params[:sort], sort_direction))

    # We explicitly load the records to avoid triggering multiple DB calls in the views when checking if records exist and iterating over them.
    # Calling @heating_types.any? in the view will use the loaded records to check existence instead of making an extra DB call.
    @heating_types.load
  end

  # GET /heating_types/1
  def show
  end

  # GET /heating_types/new
  def new
    @heating_type = HeatingType.new
  end

  # GET /heating_types/1/edit
  def edit
  end

  # POST /heating_types
  def create
    @heating_type = HeatingType.new(heating_type_params)

    if @heating_type.save
      redirect_to @heating_type, notice: "Heating type was successfully created."
    else
      render :new
    end
  end

  # PATCH/PUT /heating_types/1
  def update
    if @heating_type.update(heating_type_params)
      redirect_to @heating_type, notice: "Heating type was successfully updated."
    else
      render :edit
    end
  end

  # DELETE /heating_types/1
  def destroy
    @heating_type.destroy
    redirect_to heating_types_url, notice: "Heating type was successfully destroyed."
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_heating_type
    @heating_type = HeatingType.find(params[:id])
  end

  # Only allow a trusted parameter "white list" through.
  def heating_type_params
    params.require(:heating_type).permit(:name)
  end
end
