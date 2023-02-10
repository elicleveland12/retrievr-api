class AddScannedPetToScan < ActiveRecord::Migration[6.0]
  def change
    add_column :scans, :scanned_pet, :string
  end
end
