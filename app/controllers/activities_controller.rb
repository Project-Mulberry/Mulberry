class ActivitiesController < ApplicationController

  before_action :logged_in_user
  before_action :set_activity, only: %i[show edit]
  before_action :ensure_activity_user, only: %i[edit show]

  # GET /messages
  def index
    @activities = Activity.all
    @coupons = Coupon.all
  end

  # GET /activities/1
  def show
    # @user = User.find(params[:id])
    # @message_send = Message.where(sender_uid: params[:id]).all
    # @message_receive = Message.where(receiver_uid: params[:id]).all
  end

  # GET /messages/new
  def new
    @message = Message.new
  end

  # GET /messages/1/edit
  def edit
  end

  def accept
    @activity = Activity.find(params[:id])
    @uid = params[:uid]
    Activity.schedule_activity(@activity.id, @uid)
    redirect_to @activity
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_message
      @message = Message.find(params[:id])
    end

  def set_activity
    @activity = Activity.find(params[:id])
  end

    # Only allow a trusted parameter "white list" through.
    def message_params
      params[:message]
    end

  def ensure_activity_user
    if @activity.fst_uid != current_user.uid && @activity.snd_uid != current_user.uid
      redirect_to root_url, notice: 'You do not have access to this activity'
    end
  end
end
