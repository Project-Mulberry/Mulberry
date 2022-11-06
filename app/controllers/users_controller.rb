class UsersController < ApplicationController
  before_action :logged_in_user, except: %i[new create]
  def new
    @user = User.new
  end

  def create
    puts "params: #{params.inspect}"
    @user = User.new(user_params)

    # @user = User.create_new_user(user_params[:phone], user_params[:password])
    if @user.save
      uid = User.find_by_phone(@user.phone).uid

      # default Interest and Prompt value
      Interest.create!({:uid => uid,
                        :interest1 => '',
                        :interest2 => '',
                        :interest3 => ''})
      Prompt.create!({:uid => uid,
                      :answer1 => '',
                      :answer2 => '',
                      :answer3 => ''})

      log_in @user
      redirect_to edit_user_path(@user)

      # This line overrides the default rendering behavior, which
      # would have been to render the "create" view.
      # render "new"
    else
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
    if @user.interest.blank?
      @user.create_interest(
        uid: @user.uid,
        interest1: user_params_with_prompts_and_interests[:interest_attributes][:interest1],
        interest2: user_params_with_prompts_and_interests[:interest_attributes][:interest2],
        interest3: user_params_with_prompts_and_interests[:interest_attributes][:interest3]
      )
    else
      @user.interest.update!(
        interest1: user_params_with_prompts_and_interests[:interest_attributes][:interest1],
        interest2: user_params_with_prompts_and_interests[:interest_attributes][:interest2],
        interest3: user_params_with_prompts_and_interests[:interest_attributes][:interest3]
      )
    end

    if @user.prompt.blank?
      @user.create_prompt(
        uid: @user.uid,
        answer1: user_params_with_prompts_and_interests[:prompt_attributes][:answer1],
        answer2: user_params_with_prompts_and_interests[:prompt_attributes][:answer2],
        answer3: user_params_with_prompts_and_interests[:prompt_attributes][:answer3]
      )
    else
      @user.prompt.update!(
        uid: @user.uid,
        answer1: user_params_with_prompts_and_interests[:prompt_attributes][:answer1],
        answer2: user_params_with_prompts_and_interests[:prompt_attributes][:answer2],
        answer3: user_params_with_prompts_and_interests[:prompt_attributes][:answer3]
      )
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

  def user_params_with_prompts_and_interests
    params.require(:user).permit(
      :phone, :password , :name , :gender , :sexuality , :birthday ,
      :location, :education , :career, :height, :profile_photo,
      interest_attributes: %i[interest1 interest2 interest3],
      prompt_attributes: %i[answer1 answer2 answer3])
  end
end
