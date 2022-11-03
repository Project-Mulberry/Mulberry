class UsersController < ApplicationController
  def new
    @user = User.new
  end

  def create
    puts "params: #{params.inspect}"
    @user = User.new(user_params)

    # @user = User.create_new_user(user_params[:phone], user_params[:password])
    if @user.save
      redirect_to edit_user_path(@user)

      # This line overrides the default rendering behavior, which
      # would have been to render the "create" view.
      # render "new"
    end
  end

  def show
    # @user = User.find(params[:id])
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    # we receive all fields in params[:user]
    # # update the model
    # if successful, redirect to user page
    @user = User.find(params[:id])
    if @user.interest.blank?
      @user.interest = Interest.new(uid: @user.id)
    end

    Rails.logger.info(user_params.inspect)

    if @user.update(user_params)
      redirect_to matchmake_index_path
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
    params.require(:user).permit(
      :phone, :password , :name , :gender , :sexuality , :birthday ,
      :location, :education , :career, :height, :profile_photo)
  end
end
