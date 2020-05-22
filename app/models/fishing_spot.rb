class FishingSpot < ApplicationRecord
  belongs_to :user
  has_many :reviews
  has_many :favorites
  has_many :users, through: :reviews
end