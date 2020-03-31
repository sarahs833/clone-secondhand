class AddNewToMessage < ActiveRecord::Migration[6.0]
  def change
    add_column :messages, :new, :boolean
  end
end
