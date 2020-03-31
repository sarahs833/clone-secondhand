class Message < ApplicationRecord
  belongs_to :user
  belongs_to :chat

  after_create :change_message_new

  def change_message_new
   message = Message.find_by(id: self.id)
   message.update(new:true)
  end

  def self.turn_message_new_to_false(id)
    message = Message.find(id)
    message.update(new:false)
  end

end
