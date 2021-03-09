class Theatre < ApplicationRecord
    has_many :screens
    validates :name, presence: true
    validates :location, presence: true
end
