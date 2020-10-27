class ProjectsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_project, only: [:show, :edit, :update, :destroy]


  # GET /projects
  def index
    @shared_projects = ProjectUser.where(account_id: current_account.id)
    @account_projects = Project.where(owner_id: current_account.id)
    @account_projects = @account_projects.active_status(params[:active_status]) if params[:active_status]   
    @projects = @account_projects.joins(:project_users).merge(@shared_projects)
    @pagy, @projects = pagy(@projects)

    # We explicitly load the records to avoid triggering multiple DB calls in the views when checking if records exist and iterating over them.
    # Calling @alterations.any? in the view will use the loaded records to check existence instead of making an extra DB call.
    @projects.load
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
    @project.active = true
    @project.projecttype_list = params[:projecttype_list]
    @project.program_list = params[:program_list]
    @project.owner_id = current_account.id

    if @project.save
      #create entry for first project user account
      @project_user = ProjectUser.new
      @project_user.project_id = @project.id
      @project_user.account_id = current_account.id
      @project_user.save
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
      params.require(:project).permit(:active_status, :program_list, :projecttype_list, :name, :location, :zipcode, :climate_zone, :jurisdiction, :project_type, :description, :utility_electricity, :utility_gas, :active, :file_share, :owner_id, :provider, :code_year, :bill_at_frame, :programs, :hvac_cf2r, :total_lot_count)
    end
end
