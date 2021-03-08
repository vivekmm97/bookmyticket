class RemoveColoumnFromCoupons < ActiveRecord::Migration[5.2]
  def change
    remove_column :coupons, :screen_id
  end
end
