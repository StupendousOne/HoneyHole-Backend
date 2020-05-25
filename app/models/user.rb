class User < ApplicationRecord
    has_many :fishing_spots, dependent: :destroy
    has_many :reviews, dependent: :destroy
    has_many :favorites, dependent: :destroy
    has_many :favorite_fishing_spots, through: :favorites, dependent: :destroy
    has_many :reviewed_fishing_spots, through: :reviews, dependent: :destroy
end
