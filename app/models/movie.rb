class Movie < ApplicationRecord
  belongs_to :screen
  has_many :coupons
  has_many :bookings
  has_attached_file :image, styles: {thumb: "100x100"}
  validates_attachment_content_type :image, content_type: /\Aimage\/.*\z/
end
