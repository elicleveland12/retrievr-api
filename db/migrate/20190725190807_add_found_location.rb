class AddFoundLocation < ActiveRecord::Migration[5.2]
  def change
    add_column :posters, :found_lat, :string
    add_column :posters, :found_long, :string
  end
end
