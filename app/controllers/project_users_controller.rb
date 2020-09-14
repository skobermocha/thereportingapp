class ProjectUsersController < ApplicationController
  before_action :set_project_user, only: [:show, :edit, :update, :destroy]

  # GET /project_users
  def index
    @pagy, @project_users = pagy(ProjectUser.sort_by_params(params[:sort], sort_direction))
  end

  # GET /project_users/1
  def show
  end

  # GET /project_users/new
  def new
    @project_user = ProjectUser.new
  end

  # GET /project_users/1/edit
  def edit
  end

  # POST /project_users
  def create
    @project_user = ProjectUser.new(project_user_params)

    if @project_user.save
      redirect_to @project_user, notice: 'Project user was successfully created.'
    else
      render :new
    end
  end

  # PATCH/PUT /project_users/1
  def update
    if @project_user.update(project_user_params)
      redirect_to @project_user, notice: 'Project user was successfully updated.'
    else
      render :edit
    end
  end

  # DELETE /project_users/1
  def destroy
    @project_user.destroy
    redirect_to project_users_url, notice: 'Project user was successfully destroyed.'
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_project_user
      @project_user = ProjectUser.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def project_user_params
      params.require(:project_user).permit(:project_id_id, :account_id_id)
    end
end
