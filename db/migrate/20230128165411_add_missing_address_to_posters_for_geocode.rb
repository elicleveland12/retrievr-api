class AddMissingAddressToPostersForGeocode < ActiveRecord::Migration[6.0]
  def change
    add_column :posters, :missing_address, :string
  end
end
