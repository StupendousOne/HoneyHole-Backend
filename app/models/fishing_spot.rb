class FishingSpot < ApplicationRecord
  belongs_to :user
  has_many :reviews, dependent: :destroy
  has_many :favorites, dependent: :destroy
  has_many :users, through: :reviews, dependent: :destroy
  has_many :fish_spots, dependent: :destroy
  has_many :fish, through: :fish_spots, dependent: :destroy
end
