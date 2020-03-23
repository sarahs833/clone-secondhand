class AddFieldToUsers < ActiveRecord::Migration[6.0]
  def change
    add_column :users, :address, :string
    add_column :users, :name, :string
    add_column :users, :admin?, :boolean
    add_column :users, :seller?, :boolean
  end
end
