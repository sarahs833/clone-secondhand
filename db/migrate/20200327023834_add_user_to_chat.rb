class AddUserToChat < ActiveRecord::Migration[6.0]
  def change
    add_column :chats, :booker, :integer
  end
end
