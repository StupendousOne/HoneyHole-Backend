class ReviseSpotLocationColumns < ActiveRecord::Migration[6.0]
  def change
    rename_column :fishing_spots, :location, :longitude
  end
end
