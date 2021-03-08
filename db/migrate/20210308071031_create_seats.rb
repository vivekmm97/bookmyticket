class CreateSeats < ActiveRecord::Migration[5.2]
  def change
    create_table :seats do |t|
      t.integer :seat_count

      t.timestamps
    end
  end
end
