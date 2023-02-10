class ChangeFinderRadiusDatatypeToInteger < ActiveRecord::Migration[6.0]
  def change
    change_column :users, :finder_radius, 'integer USING CAST (finder_radius as integer)'
  end
end
