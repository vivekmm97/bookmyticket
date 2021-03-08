class AddFieldsToScreens < ActiveRecord::Migration[5.2]
  def change
    add_reference :screens, :seat, foreign_key: true
    add_reference :screens, :timing, foreign_key: true
    remove_column :screens, :seat_count
    remove_column :screens, :time
  end
end
