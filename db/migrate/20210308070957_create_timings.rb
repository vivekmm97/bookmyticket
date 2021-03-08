class CreateTimings < ActiveRecord::Migration[5.2]
  def change
    create_table :timings do |t|
      t.string :time

      t.timestamps
    end
  end
end
