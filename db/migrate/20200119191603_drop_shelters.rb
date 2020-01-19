class DropShelters < ActiveRecord::Migration[5.2]
  def change
    drop_table :shelters
  end
end
