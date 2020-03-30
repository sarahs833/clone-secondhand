class AddNewToChat < ActiveRecord::Migration[6.0]
  def change
    add_column :chats, :new, :boolean
  end
end
