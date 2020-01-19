class DropShelterIdFromPets < ActiveRecord::Migration[5.2]
  def change
    remove_column :pets, :shelter_id
  end
end
