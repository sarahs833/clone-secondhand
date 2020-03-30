class AddNewToChats < ActiveRecord::Migration[6.0]
  def change
    add_column :chats,:new, :boolean, :default => false
  end
end
