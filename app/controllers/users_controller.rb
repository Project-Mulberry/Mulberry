class UsersController < ApplicationController
  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      redirect_to edit_user_path(@user)
    else
      # This line overrides the default rendering behavior, which
      # would have been to render the "create" view.
      render "new"
    end
  end

  def show
    @user = User.find(params[:id])
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    # we receive all fields in params[:user]
    # # update the model
    # if successful, redirect to user page
    @user = User.find(params[:id])
    # @user = User.new(user_params)

    if @user.update(user_params)
      redirect_to user_path(@user)
    else
      # This line overrides the default rendering behavior, which
      # would have been to render the "create" view.
      render "edit"
    end

  end

  def destroy
  end

  private

  def user_params
    params.require(:user).permit(:phone, :password , :name , :gender , :sexuality , :birthday , :location, :education , :career, :height, :profile_photo, :created_time)
  end
end
