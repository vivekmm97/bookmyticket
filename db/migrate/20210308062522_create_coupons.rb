class CreateCoupons < ActiveRecord::Migration[5.2]
  def change
    create_table :coupons do |t|
      t.string :code
      t.integer :coupon_count
      t.integer :percentage
      t.references :screen, foreign_key: true

      t.timestamps
    end
  end
end
