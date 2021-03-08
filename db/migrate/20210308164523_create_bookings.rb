class CreateBookings < ActiveRecord::Migration[5.2]
  def change
    create_table :bookings do |t|
      t.string :coupon_code
      t.references :user, foreign_key: true
      t.references :movie, foreign_key: true
      t.integer :total_fee
      t.integer :seat_count

      t.timestamps
    end
  end
end
