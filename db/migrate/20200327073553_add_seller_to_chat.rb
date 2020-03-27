class AddSellerToChat < ActiveRecord::Migration[6.0]
  def change
    add_column :chats, :seller_id, :integer
  end
end
