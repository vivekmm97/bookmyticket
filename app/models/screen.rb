class Screen < ApplicationRecord
  belongs_to :theatre
  has_many :movies
  has_many :coupons
end
