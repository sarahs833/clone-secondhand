class Chat < ApplicationRecord
  belongs_to :booking
  has_many :messages, dependent: :destroy

  after_create :create_first_message


  def create_first_message
    Message.create(chat_id: self.id, user_id: self.booker, content: "Hi, i have just booked your product")
  end
end
