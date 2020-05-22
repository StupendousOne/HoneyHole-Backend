class Fish < ApplicationRecord
    has_many :fish_spots
    has_many :fishing_spots, through: :fish_spots
end
