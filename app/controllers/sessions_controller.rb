class SessionsController < ApplicationController
  before_action :ensure_owner_user, only: %i[new create]

  def new
    @user = User.new
  end

  def create
    user = User.find_by(phone: params[:user][:phone])
    if user && user.password == params[:user][:password]
      log_in user
      if user.profile_created?
        redirect_to matchmake_index_path
      else
        redirect_to edit_user_path(user)
      end
    else
      flash.now[:danger] = 'Invalid email/password combination'
      render 'new'
    end
  end

  def destroy
    log_out
    redirect_to login_path
  end


  private
  def set_user
    @user = User.find(params[:id])
  end

  def ensure_owner_user
    if @user != current_user
      redirect_to root_url
    end
  end
end