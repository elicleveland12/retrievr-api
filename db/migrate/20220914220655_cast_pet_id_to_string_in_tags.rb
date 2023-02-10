class CastPetIdToStringInTags < ActiveRecord::Migration[6.0]
  def change
    change_column :tags, :pet_id, :string
  end
end
