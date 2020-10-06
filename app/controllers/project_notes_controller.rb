class ProjectNotesController < ApplicationController
  before_action :get_project
  before_action :set_project_note, only: [:show, :edit, :update, :destroy]
  

  # GET /project_notes
  def index
    @pagy, @project_notes = pagy(ProjectNote.sort_by_params(params[:sort], sort_direction))

    # We explicitly load the records to avoid triggering multiple DB calls in the views when checking if records exist and iterating over them.
    # Calling @alteration_notes.any? in the view will use the loaded records to check existence instead of making an extra DB call.
    @project_notes.load
  end

  # GET /project_notes/1
  def show
  end

  # GET /project_notes/new
  def new
    @project_note = @project.project_notes.build
  end

  # GET /project_notes/1/edit
  def edit
  end

  # POST /project_notes
  def create
    @project_note = @project.project_notes.build(project_note_params)

    if @project_note.save
      redirect_to project_path(@project), notice: 'Project note was successfully created.'
    else
      render :new
    end
  end

  # PATCH/PUT /project_notes/1
  def update
    if @project_note.update(project_note_params)
      redirect_to project_path(@project), notice: 'Project note was successfully updated.'
    else
      render :edit
    end
  end

  # DELETE /project_notes/1
  def destroy
    @project_note.destroy
    redirect_to project_path(@project), notice: 'Project note was successfully destroyed.'
  end

  private
    def get_project
      @project = Project.find(params[:project_id])
    end

    # Use callbacks to share common setup or constraints between actions.
    def set_project_note
      @project_note = @project.project_notes.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def project_note_params
      params.require(:project_note).permit(:text, :user_id, :project_id)
    end
end
