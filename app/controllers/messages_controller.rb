class MessagesController < ApplicationController

def new
  @message = Message.new()
end

def create
  @message = Message.new(params_message)
  @message.user_id = current_user.id
  @message.chat_id = params[:message][:chat_id]
  @message.save
end

private

def params_message
  params.require(:message).permit(:content, :user_id, :chat_id)
end

end
