class User < ApplicationRecord
    has_many :fishing_spots
    has_many :reviews
    has_many :favorites
    has_many :favorite_fishing_spots, through: :favorites
    has_many :reviewed_fishing_spots, through: :reviews
end
