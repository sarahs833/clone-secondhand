class CreateBookings < ActiveRecord::Migration[6.0]
  def change
    create_table :bookings do |t|
      t.references :user, null: false, foreign_key: true
      t.references :product, null: false, foreign_key: true
      t.boolean :paid
      t.boolean :cancelled
      t.boolean :refunded

      t.timestamps
    end
  end
end
