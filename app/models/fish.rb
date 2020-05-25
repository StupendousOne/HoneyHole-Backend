class Fish < ApplicationRecord
    has_many :fish_spots, dependent: :destroy
    has_many :fishing_spots, through: :fish_spots, dependent: :destroy
end
