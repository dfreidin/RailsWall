class MessagesController < ApplicationController
  def index
    @user = User.find(session[:user_id])
    @messages = Message.includes(:comments).all
  end

  def create
    @message = Message.new(message_params)
    @message.user = User.find(session[:user_id])
    unless @message.save
      flash[:error] = @message.errors.full_messages
    end
    redirect_to messages_path
  end

  private
  def message_params
    params.require(:message).permit(:message)
  end
end
