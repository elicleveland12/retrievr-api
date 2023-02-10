class UpdatePetAttributesTryAgain < ActiveRecord::Migration[6.0]
  def change
    change_column :pets, :energy_level, 'integer USING CAST (energy_level as integer)'
    change_column :pets, :temperment, 'integer USING CAST (temperment as integer)'
    add_column :pets, :intelligence, :integer
    add_column :pets, :protectiveness, :integer
    add_column :pets, :sharing, :integer
    remove_column :pets, :breed
  end
end
