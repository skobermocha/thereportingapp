class LotsController < ApplicationController
  before_action :authenticate_user!
  before_action :get_project
  before_action :set_lot, only: [:show, :edit, :update, :destroy]

  # GET /lots
  def index
    @pagy, @lots = pagy(Lot.where(project_id: params[:project_id]).sort_by_params(params[:sort], sort_direction))
  end

  # GET /lots/1
  def show
  end

  # GET /lots/new
  def new
    @lot = @project.lots.build
  end

  # GET /lots/1/edit
  def edit
  end

  # POST /lots
  def create
    @lot = @project.lots.build(lot_params)

    if @lot.save
      redirect_to project_lot_path(@project, @lot), notice: 'Lot was successfully created.'
    else
      render :new
    end
  end

  # PATCH/PUT /lots/1
  def update
    if @lot.update(lot_params)
      redirect_to project_lot_path(@project, @lot), notice: 'Lot was successfully updated.'
    else
      render :edit
    end
  end

  # DELETE /lots/1
  def destroy
    @lot.destroy
    redirect_to project_lots_url(@project), notice: 'Lot was successfully destroyed.'
  end

  private
    def get_project
      @project = Project.find(params[:project_id])
    end

    # Use callbacks to share common setup or constraints between actions.
    def set_lot
      @lot = Lot.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def lot_params
      params.require(:lot).permit(:project_id, :permit, :phase, :lot, :address, :plan_type_id)
    end
end
