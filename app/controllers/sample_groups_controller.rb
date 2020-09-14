class SampleGroupsController < ApplicationController
  before_action :set_sample_group, only: [:show, :edit, :update, :destroy]

  # GET /sample_groups
  def index
    @pagy, @sample_groups = pagy(SampleGroup.sort_by_params(params[:sort], sort_direction))
  end

  # GET /sample_groups/1
  def show
  end

  # GET /sample_groups/new
  def new
    @sample_group = SampleGroup.new
  end

  # GET /sample_groups/1/edit
  def edit
  end

  # POST /sample_groups
  def create
    @sample_group = SampleGroup.new(sample_group_params)

    if @sample_group.save
      redirect_to @sample_group, notice: 'Sample group was successfully created.'
    else
      render :new
    end
  end

  # PATCH/PUT /sample_groups/1
  def update
    if @sample_group.update(sample_group_params)
      redirect_to @sample_group, notice: 'Sample group was successfully updated.'
    else
      render :edit
    end
  end

  # DELETE /sample_groups/1
  def destroy
    @sample_group.destroy
    redirect_to sample_groups_url, notice: 'Sample group was successfully destroyed.'
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_sample_group
      @sample_group = SampleGroup.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def sample_group_params
      params.require(:sample_group).permit(:project_id_id, :lot_id_id, :name)
    end
end
