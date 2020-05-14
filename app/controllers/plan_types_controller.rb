class PlanTypesController < ApplicationController
  before_action :get_project
  before_action :set_plan_type, only: [:show, :edit, :update, :destroy]

  # GET /plan_types
  def index
    @pagy, @plan_types = pagy(PlanType.sort_by_params(params[:sort], sort_direction))
  end

  # GET /plan_types/1
  def show
  end

  # GET /plan_types/new
  def new
    @plan_type = @project.plan_type.build
  end

  # GET /plan_types/1/edit
  def edit
  end

  # POST /plan_types
  def create
    @plan_type = @project.plan_type.build(plan_type_params)

    if @plan_type.save
      redirect_to @plan_type, notice: 'Plan type was successfully created.'
    else
      render :new
    end
  end

  # PATCH/PUT /plan_types/1
  def update
    if @plan_type.update(plan_type_params)
      redirect_to @plan_type, notice: 'Plan type was successfully updated.'
    else
      render :edit
    end
  end

  # DELETE /plan_types/1
  def destroy
    @plan_type.destroy
    redirect_to project_plan_types_url(@project), notice: 'Plan type was successfully destroyed.'
  end

  private
    def get_project
      @project = Project.find(params[:project_id])
    end

    # Use callbacks to share common setup or constraints between actions.
    def set_plan_type
      @plan_type = PlanType.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def plan_type_params
      params.require(:plan_type).permit(:project_id, :name, :xml_store, :hers, :model_test)
    end
end
