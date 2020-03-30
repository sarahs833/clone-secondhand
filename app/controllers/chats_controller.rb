class ChatsController < ApplicationController

  def index
   @bookings = Booking.all.includes(:product)
   @bookings.each do |b|
     @seller_id = b.product.user_id == current_user.id
   end
    @chats = Chat.where(booker: current_user.id)
    .or(Chat.where(seller_id: @seller_id))
  end

  def show
    @c = Chat.isOrNotNew(params[:id])
    @chat = Chat.find(params[:id])
    if @chat.booker == current_user.id || @chat.seller_id == current_user.id
      @chat_messages = @chat.messages.includes(:user)
    end
  end
end
