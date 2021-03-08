json.extract! booking, :id, :coupon_code, :user_id, :movie_id, :total_fee, :seat_count, :created_at, :updated_at
json.url booking_url(booking, format: :json)
