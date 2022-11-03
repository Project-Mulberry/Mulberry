# :nocov:


class MessagesController < ApplicationController

  # GET /messages
  def index
    @users = User.all
  end

  # GET /messages/1
  def show
    @user = User.find(params[:id])
    @message_send = Message.pull_send_message_by_id(params[:id])
    @message_receive = Message.pull_receive_message_by_id(params[:id])
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
