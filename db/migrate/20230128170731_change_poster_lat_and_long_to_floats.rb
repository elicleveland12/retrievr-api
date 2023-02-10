class ChangePosterLatAndLongToFloats < ActiveRecord::Migration[6.0]
  def change
    change_column :posters, :latitude, :float, using: 'latitude::double precision'
    change_column :posters, :longitude, :float, using: 'latitude::double precision'
  end
end
