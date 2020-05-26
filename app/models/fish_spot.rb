class FishSpot < ApplicationRecord
  belongs_to :fish
  belongs_to :fishing_spot
  validates :fish_id, uniqueness: { scope: :fishing_spot,
    message: "should appear only once per spot" }
end
