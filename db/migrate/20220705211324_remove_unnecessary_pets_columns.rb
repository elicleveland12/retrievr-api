class RemoveUnnecessaryPetsColumns < ActiveRecord::Migration[6.0]
  def change
    remove_column :pets, :sold
    remove_column :pets, :adopted
    remove_column :pets, :fixed
    remove_column :pets, :price
    remove_column :pets, :health
    remove_column :pets, :number
    remove_column :pets, :mixed
    remove_column :pets, :unknown
    remove_column :pets, :size
    add_column :pets, :group_name, :string
    remove_column :pets, :group_name
    add_column :pets, :temperment, :string
    add_column :pets, :energy_level, :string
    add_column :pets, :description, :text
  end
end
