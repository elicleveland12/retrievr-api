class AddNfcIdToTags < ActiveRecord::Migration[7.0]
  def change
    add_column :tags, :nfc_id, :string
  end
end
