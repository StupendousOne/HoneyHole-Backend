class CreateLatitudeColumnOnFishingSpots < ActiveRecord::Migration[6.0]
  def change
    add_column :fishing_spots, :latitude, :string
  end
end
