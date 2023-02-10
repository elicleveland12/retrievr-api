class ChangeLatAndLongToLatitudeAndLongitude < ActiveRecord::Migration[6.0]
  def change
    rename_column :posters, :lat, :latitude
    rename_column :posters, :long, :longitude
  end
end
