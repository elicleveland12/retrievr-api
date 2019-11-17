class AddShelterColumnToPets < ActiveRecord::Migration[5.2]
  def change
    add_column :pets, :shelter_id, :integer
  end
end
