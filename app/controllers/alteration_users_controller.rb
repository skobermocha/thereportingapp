class AlterationUsersController < ApplicationController
  before_action :authenticate_user!
  before_action :get_alteration
  before_action :set_alteration_user, only: [:show, :edit, :update, :destroy]

  # GET /alteration_users
  def index
    @pagy, @alteration_users = pagy(AlterationUser.sort_by_params(params[:sort], sort_direction))

    # We explicitly load the records to avoid triggering multiple DB calls in the views when checking if records exist and iterating over them.
    # Calling @alteration_users.any? in the view will use the loaded records to check existence instead of making an extra DB call.
    @alteration_users.load
  end

  # GET /alteration_users/1
  def show
  end

  # GET /alteration_users/new
  def new
    @alteration_user = @alteraion.alteration_user.build
  end

  # GET /alteration_users/1/edit
  def edit
  end

  # POST /alteration_users
  def create
    @alteration_user = @alteraion.alteration_user.build(alteration_user_params)
    
    if @alteration_user.save
      redirect_to alteration_path(@alteration), notice: "Alteration user was successfully created."
    else
      render :new
    end
  end

  # PATCH/PUT /alteration_users/1
  def update
    if @alteration_user.update(alteration_user_params)
      redirect_to alteration_alteration_user_path(@alteration), notice: "Alteration user was successfully updated."
    else
      render :edit
    end
  end

  # DELETE /alteration_users/1
  def destroy
    @alteration_user.destroy
    redirect_to alteration_alteration_user_path(@alteration), notice: "Alteration user was successfully destroyed."
  end

  private
  def get_alteration
      @alteration = Alteration.find(params[:alteration_id])
  end
  # Use callbacks to share common setup or constraints between actions.
  def set_alteration_user
    @alteration_user = AlterationUser.find(params[:id])
  end

  # Only allow a trusted parameter "white list" through.
  def alteration_user_params
    params.require(:alteration_user).permit(:account_id, :alteration_id)
  end
end
