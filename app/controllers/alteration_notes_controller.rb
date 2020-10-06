class AlterationNotesController < ApplicationController
  before_action :get_alteration
  before_action :set_alteration_note, only: [:show, :edit, :update, :destroy]

  # GET /alteration_notes
  def index
    @pagy, @alteration_notes = pagy(AlterationNote.sort_by_params(params[:sort], sort_direction))

    # We explicitly load the records to avoid triggering multiple DB calls in the views when checking if records exist and iterating over them.
    # Calling @alteration_notes.any? in the view will use the loaded records to check existence instead of making an extra DB call.
    @alteration_notes.load
  end

  # GET /alteration_notes/1
  def show
  end

  # GET /alteration_notes/new
  def new
    @alteration_note = @alteration.alteration_notes.build
  end

  # GET /alteration_notes/1/edit
  def edit
  end

  # POST /alteration_notes
  def create
    @alteration_note = @alteration.alteration_notes.build(alteration_note_params)

    if @alteration_note.save
      redirect_to alteration_path(@alteration), notice: "Alteration note was successfully created."
    else
      render :new
    end
  end

  # PATCH/PUT /alteration_notes/1
  def update
    if @alteration_note.update(alteration_note_params)
      redirect_to alteration_path(@alteration), notice: "Alteration note was successfully updated."
    else
      render :edit
    end
  end

  # DELETE /alteration_notes/1
  def destroy
    @alteration_note.destroy
    redirect_to alteration_path(@alteration), notice: "Alteration note was successfully destroyed."
  end

  private
  def get_alteration
      @alteration = Alteration.find(params[:alteration_id])
  end
  # Use callbacks to share common setup or constraints between actions.
  def set_alteration_note
    @alteration_note = @alteration.alteration_note.find(params[:id])
  end

  # Only allow a trusted parameter "white list" through.
  def alteration_note_params
    params.require(:alteration_note).permit(:alteration_id, :user_id, :text)
  end
end
