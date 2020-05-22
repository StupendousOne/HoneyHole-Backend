class FishingSpot < ApplicationRecord
  belongs_to :user
  has_many :reviews
  has_many :favorites
  has_many :users, through: :reviews
  has_many :fish_spots
  has_many :fish, through: :fish_spots
end
