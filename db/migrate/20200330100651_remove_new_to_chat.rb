class RemoveNewToChat < ActiveRecord::Migration[6.0]
  def change
    remove_column :chats, :new
  end
end
