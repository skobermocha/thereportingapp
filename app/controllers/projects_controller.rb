class ProjectsController < ApplicationController
  before_action :set_project, only: [:show, :edit, :update, :destroy]


  # GET /projects
  def index
    @shares = ProjectUser.where(account_id: current_account.id)
    @shared_projects = Project.joins(:project_users).merge(@shares)
    @projects = Project.where(account_id: current_account.id).sort_by_params(params[:sort], sort_direction)
    @pagy, @projects = pagy(@projects)

    
  end

  # GET /projects/1
  def show
  end

  # GET /projects/new
  def new
    @project = Project.new
  end

  # GET /projects/1/edit
  def edit
    @project.programs.each do |program|
      if program.name == "CAHP"
        @CAHP = true
      end
      if program.name == "CMFMH"
        @CMFMH = true
      end
      if program.name == "LEED"
        @LEED = true
      end
      if program.name == "GPR"
        @GPR = true
      end
      if program.name == "EStar"
        @ESTAR = true
      end
      if program.name == "TCAC"
        @TCAC = true
      end
    end

    @project.projecttypes.each do |type|
      if type.name == "RNC SF"
        @RNCSF = true
      end
      if type.name == "RNC MF"
        @RNCMF = true
      end
      if type.name == "High Rise"
        @HighRise = true
      end
      if type.name == "Mixed Use"
        @MixedUse = true
      end
      if type.name == "Non-Res"
        @NonRes = true
      end
    end
  end

  # POST /projects
  def create
    @project = Project.new(project_params)
    @project.projecttype_list = params[:projecttype_list]
    @project.program_list = params[:program_list]
    @project.account_id = current_account.id
    if @project.save
      redirect_to @project, notice: 'Project was successfully created.'
    else
      render :new
    end
  end

  # PATCH/PUT /projects/1
  def update

    @project.projecttype_list = params[:projecttype_list]
    @project.program_list = params[:program_list]
    if @project.update(project_params)
      redirect_to @project, notice: 'Project was successfully updated.'
    else
      render :edit
    end
  end

  # DELETE /projects/1
  def destroy
    @project.destroy
    redirect_to projects_url, notice: 'Project was successfully destroyed.'
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_project
      @project = Project.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def project_params
      params.require(:project).permit(:program_list, :projecttype_list, :name, :location, :zipcode, :climate_zone, :jurisdiction, :project_type, :description, :utility_electricity, :utility_gas, :active, :file_share, :account_id, :provider, :code_year, :bill_at_frame, :programs, :hvac_cf2r, :total_lot_count)
    end
end
