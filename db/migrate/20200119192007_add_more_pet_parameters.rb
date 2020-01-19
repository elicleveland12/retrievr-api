class AddMorePetParameters < ActiveRecord::Migration[5.2]
  def change
    add_column :pets, :breed_primary, :string
    add_column :pets, :breed_secondary, :string
    add_column :pets, :mixed, :boolean
    add_column :pets, :unknown, :boolean
    add_column :pets, :color_primary, :string
    add_column :pets, :color_secondary, :string
    add_column :pets, :color_tertiary, :string
    add_column :pets, :size, :string
    remove_column :pets, :color
  end
end
