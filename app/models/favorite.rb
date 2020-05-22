class Favorite < ApplicationRecord
  belongs_to :user
  belongs_to :favorite_fishing_spots, class_name: "FishingSpot", foreign_key: "fishing_spot_id"
end
