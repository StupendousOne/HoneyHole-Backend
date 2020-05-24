class ChangeDescColumnNameOnFishingSpots < ActiveRecord::Migration[6.0]
  def change
    rename_column :fishing_spots, :description, :public_access
  end
end
