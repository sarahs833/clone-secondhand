class MessagesController < ApplicationController

def new
  @message = Message.new()
end

def create
  @message = Message.new(params_message)
  @message.user_id = current_user.id
  @message.chat_id = params[:message][:chat_id]
  @message.save

  @bookings = Booking.all.includes(:product)
   @bookings.each do |b|
     @seller_id = b.product.user_id == current_user.id
   end
    @chats = Chat.where(booker: current_user.id).includes(:messages)
    .or(Chat.where(seller_id: @seller_id).includes(:messages))
  render "chats/index"
  # redirect_back(fallback_location: root_path)
end

private

def params_message
  params.require(:message).permit(:content, :user_id, :chat_id)
end

end
