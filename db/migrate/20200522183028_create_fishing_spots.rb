class CreateFishingSpots < ActiveRecord::Migration[6.0]
  def change
    create_table :fishing_spots do |t|
      t.string :name
      t.string :location
      t.string :image
      t.string :description
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
