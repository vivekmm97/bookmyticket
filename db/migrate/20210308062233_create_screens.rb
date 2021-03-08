class CreateScreens < ActiveRecord::Migration[5.2]
  def change
    create_table :screens do |t|
      t.string :date
      t.integer :fee
      t.references :theatre, foreign_key: true
      t.integer :seat_count
      t.integer :time

      t.timestamps
    end
  end
end
