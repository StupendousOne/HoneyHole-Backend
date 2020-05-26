class AddIsActiveToFishingSpots < ActiveRecord::Migration[6.0]
  def change
    add_column :fishing_spots, :is_active, :boolean
  end
end
