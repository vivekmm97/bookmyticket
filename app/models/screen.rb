class Screen < ApplicationRecord
  belongs_to :theatre
  has_many :movies
  has_many :coupons
  # validates :date, presence: true, format: { with: /^\d{2}-\d{2}-\d{4}$/, message: "Maintain DD-MM-YYYY format"}
  validates :fee, presence: true
end
