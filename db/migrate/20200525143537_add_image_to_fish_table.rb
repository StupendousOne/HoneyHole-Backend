class AddImageToFishTable < ActiveRecord::Migration[6.0]
  def change
    add_column :fish, :image, :string
  end
end
