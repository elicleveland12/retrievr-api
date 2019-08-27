class AddFinderRadiusToUserModel < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :finder_radius, :string
  end
end
