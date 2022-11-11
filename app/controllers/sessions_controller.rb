class SessionsController < ApplicationController
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
end
