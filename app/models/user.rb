class User < ApplicationRecord
    has_many :fishing_spots, dependent: :destroy
    has_many :reviews, dependent: :destroy
    has_many :favorites, dependent: :destroy
    has_many :favorite_fishing_spots, through: :favorites
    has_many :reviewed_fishing_spots, through: :reviews
end
