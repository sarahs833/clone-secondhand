class Booking < ApplicationRecord
  belongs_to :user
  belongs_to :product
  has_one :chat

  after_create :create_chat

  def create_chat
    Chat.create(booking_id: self.id, name: "first chat", booker: self.user.id)
  end
end
