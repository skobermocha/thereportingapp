class CoolingTypesController < ApplicationController
  before_action :authenticate_user!
  before_action :set_cooling_type, only: [:show, :edit, :update, :destroy]

  # GET /cooling_types
  def index
    @pagy, @cooling_types = pagy(CoolingType.sort_by_params(params[:sort], sort_direction))

    # We explicitly load the records to avoid triggering multiple DB calls in the views when checking if records exist and iterating over them.
    # Calling @cooling_types.any? in the view will use the loaded records to check existence instead of making an extra DB call.
    @cooling_types.load
  end

  # GET /cooling_types/1
  def show
  end

  # GET /cooling_types/new
  def new
    @cooling_type = CoolingType.new
  end

  # GET /cooling_types/1/edit
  def edit
  end

  # POST /cooling_types
  def create
    @cooling_type = CoolingType.new(cooling_type_params)

    if @cooling_type.save
      redirect_to @cooling_type, notice: "Cooling type was successfully created."
    else
      render :new
    end
  end

  # PATCH/PUT /cooling_types/1
  def update
    if @cooling_type.update(cooling_type_params)
      redirect_to @cooling_type, notice: "Cooling type was successfully updated."
    else
      render :edit
    end
  end

  # DELETE /cooling_types/1
  def destroy
    @cooling_type.destroy
    redirect_to cooling_types_url, notice: "Cooling type was successfully destroyed."
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_cooling_type
    @cooling_type = CoolingType.find(params[:id])
  end

  # Only allow a trusted parameter "white list" through.
  def cooling_type_params
    params.require(:cooling_type).permit(:name)
  end
end
