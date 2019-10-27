class AddFoundToPet < ActiveRecord::Migration[5.2]
  def change
    add_column :pets, :found, :boolean
  end
end
