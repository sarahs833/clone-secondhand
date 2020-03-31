class ChatsController < ApplicationController

  def index
   @bookings = Booking.all.includes(:product)
   @bookings.each do |b|
     @seller_id = b.product.user_id == current_user.id
   end
    @chats = Chat.where(booker: current_user.id).includes(:messages)
    .or(Chat.where(seller_id: current_user.id).includes(:messages))

  end

  def show
    @c = Chat.find(params[:id])
    @c.messages.each do |m|
      if m.new
        Message.turn_message_new_to_false(m.id)
      end
    end
    @chat = Chat.find(params[:id])
    if @chat.booker == current_user.id || @chat.seller_id == current_user.id
      @chat_messages = @chat.messages.includes(:user)
    end
  end
end
