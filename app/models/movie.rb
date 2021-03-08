class Movie < ApplicationRecord
  belongs_to :screen
  has_many :coupons
  has_many :bookings
end
