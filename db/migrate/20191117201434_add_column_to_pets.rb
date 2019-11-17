class AddColumnToPets < ActiveRecord::Migration[5.2]
  def change
    add_column :pets, :sold, :boolean, :default => false
    add_column :pets, :adopted, :boolean, :default => false
    add_column :pets, :species, :string
    add_column :pets, :fixed, :boolean, :default => false
    add_column :pets, :price, :string
    add_column :pets, :health, :string
    add_column :pets, :color, :string
    add_column :pets, :sex, :string
    add_column :pets, :number, :string
    add_column :pets, :litter_id, :integer
  end
end
