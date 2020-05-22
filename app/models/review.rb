class Review < ApplicationRecord
  belongs_to :reviewed_fishing_spots, class_name: "FishingSpot", foreign_key: "fishing_spot_id"
  belongs_to :user
end
