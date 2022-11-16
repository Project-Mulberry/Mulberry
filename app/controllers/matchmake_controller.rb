class MatchmakeController < ApplicationController

  before_action :logged_in_user

  # GET /matchmake
  def index
    @users = User.where(uid: current_user.uid)
    @history_matches = MatchHistory.get_history_matched_uid_list(current_user.uid)
    @new_matches = MatchHistory.get_match_recommendation(current_user.uid)
  end

  # GET /matchmake/1
  def show
    id = params[:id]
    @user = User.find(id)
    @interest = Interest.get_interests_by_uid(id)
    @prompt = Prompt.get_prompt_by_uid(id)
  end

  # DELETE /matchmake/1
  def destroy
    #@user.destroy
    #redirect_to matchmake_url, notice: 'User was successfully destroyed.'
  end

end
