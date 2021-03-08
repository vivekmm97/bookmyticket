json.extract! coupon, :id, :code, :coupon_count, :percentage, :screen_id, :created_at, :updated_at
json.url coupon_url(coupon, format: :json)
