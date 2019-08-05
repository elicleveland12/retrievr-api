class AddImageUrlToPet < ActiveRecord::Migration[5.2]
  def change
    add_column :pets, :imagePath, :string
  end
end
