class ChangeMissingAddressToAddress < ActiveRecord::Migration[6.0]
  def change
    rename_column :posters, :missing_address, :address
  end
end
