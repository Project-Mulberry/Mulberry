class MessagesController < ApplicationController

  before_action :logged_in_user

  # GET /messages
  def index
    @messages = Message.get_message_list(current_user.uid)
  end

  # GET /messages/1
  def show
    @message = Message.new
    @user = User.find(params[:id])
    @chat = Message.pull_message(current_user.uid,params[:id])
    @activities = Activity.pull_dual_activities(current_user.uid, params[:id])
    coupon_ids = []
    @activities.each do |activity|
      coupon_ids.push(activity["coupon_id"])
    end
    @coupons = {}
    Coupon.all.to_a.each do |coupon|
      @coupons[coupon["cid"].to_i] = coupon
    end
  end

  # GET /messages/new
  def create_new
    # @message = Message.new(:sender_uid => current_user.uid,
    #                        :receiver_uid => params[:id],
    #                        :key => Message.generate_key(current_user.uid, params[:id].to_i),
    #                        :timestamp => DateTime.now(),
    #                        :message => params[:message][:message],
    #                        :is_read => false)

    if not params[:message][:message].to_s.strip.empty?
      @message = Message.post_message(current_user.uid, params[:id].to_i, params[:message][:message])
      redirect_to message_path(params[:id], anchor: 'bottom')
    else
      redirect_to message_path(params[:id])
    end
  end

end
