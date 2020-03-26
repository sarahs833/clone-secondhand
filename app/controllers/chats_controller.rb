class ChatsController < ApplicationController

  def index
    @chats = Chat.all
  end

  def show
    @chat = Chat.find(params[:id])
    @chat_messages = @chat.messages
  end
end
