class RemoveScannedPetColumnFromScan < ActiveRecord::Migration[6.0]
  def change
    remove_column :scans, :scanned_pet
  end
end
