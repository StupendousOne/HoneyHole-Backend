class AddSecondImageColumnToLakes < ActiveRecord::Migration[6.0]
  def change
    add_column :fishing_spots, :image_small, :string
  end
end
