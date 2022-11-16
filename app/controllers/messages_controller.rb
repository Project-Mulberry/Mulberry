class MessagesController < ApplicationController

  before_action :logged_in_user

  # GET /messages
  def index
    @messages = Message.get_message_list(current_user.uid)
  end

  # GET /messages/1
  def show
    @user = User.find(params[:id])
    @chat = Message.pull_message(current_user.uid,params[:id])
    @activities = Activity.pull_dual_activities(current_user.uid, params[:id])
    coupon_ids = []
    @activities.each do |activity|
      coupon_ids.push(activity["coupon_id"])
    end
    @coupons = {}
    Coupon.where("cid IN (?)", coupon_ids).each do |coupon|
      @coupons[coupon["cid"]] = coupon
    end
  end

  # GET /messages/new
  def new
    @message = Message.new
  end

  # GET /messages/1/edit
  def edit
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_message
      @message = Message.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def message_params
      params[:message]
    end
end
