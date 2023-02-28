class RemoveParkIdFromTags < ActiveRecord::Migration[7.0]
  def change
    remove_column :tags, :park_id
  end
end
