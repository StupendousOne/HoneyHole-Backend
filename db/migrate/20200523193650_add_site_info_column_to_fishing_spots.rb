class AddSiteInfoColumnToFishingSpots < ActiveRecord::Migration[6.0]
  def change
    add_column :fishing_spots, :site_info, :string
  end
end
