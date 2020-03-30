class Booking < ApplicationRecord
  belongs_to :user
  belongs_to :product
  has_one :chat

  after_create :create_chat

  def create_chat
    Chat.create(booking_id: self.id, name: "chat #{self.id}", booker: self.user.id, seller_id: self.product.user.id, new: true)
  end
end
