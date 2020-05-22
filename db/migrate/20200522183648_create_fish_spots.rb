class CreateFishSpots < ActiveRecord::Migration[6.0]
  def change
    create_table :fish_spots do |t|
      t.references :fish, null: false, foreign_key: true
      t.references :fishing_spot, null: false, foreign_key: true

      t.timestamps
    end
  end
end
