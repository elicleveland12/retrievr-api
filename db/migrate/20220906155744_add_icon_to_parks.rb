class AddIconToParks < ActiveRecord::Migration[6.0]
  def change
    add_column :parks, :icon, :string
  end
end
