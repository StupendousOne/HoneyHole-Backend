class AddIsActiveToFish < ActiveRecord::Migration[6.0]
  def change
    add_column :fish, :is_active, :boolean
  end
end
