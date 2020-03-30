class Message < ApplicationRecord
  belongs_to :user
  belongs_to :chat


  def self.change_chat_new(id)
   message = Chat.find_by(id: id)
   message.update(new:true)
  end

end
