class CreateFish < ActiveRecord::Migration[6.0]
  def change
    create_table :fish do |t|
      t.string :species
      t.string :description

      t.timestamps
    end
  end
end
