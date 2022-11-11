class MatchmakeController < ApplicationController

  # GET /matchmake
  def index
    @users = User.all
  end

  # GET /matchmake/1
  def show
    id = params[:id]
    @user = User.find(id)
    @interest = Interest.get_interests_by_uid(id)
    @prompt = Prompt.get_prompt_by_uid(id)
  end

  # GET /matchmake/new
  def new
    @user = User.new
  end


  # POST /matchmake
  def create
    @user = User.new(user_params)

    if @user.save
      redirect_to @user, notice: 'User was successfully created.'
    else
      render :new
    end
  end

  # PATCH/PUT /matchmake/1
  def update
    if @user.update(user_params)
      redirect_to @user, notice: 'User was successfully updated.'
    else
      render :chat
    end
  end

  # DELETE /matchmake/1
  def destroy
    #@user.destroy
    #redirect_to matchmake_url, notice: 'User was successfully destroyed.'
  end

  private
  # Use callbacks to share common setup or constraints between actions.
  def set_user
    @user = User.find(params[:id])
  end

  # Only allow a trusted parameter "white list" through.
  def user_params
    params[:user]
  end
end
