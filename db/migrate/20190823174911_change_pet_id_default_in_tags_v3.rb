class ChangePetIdDefaultInTagsV3 < ActiveRecord::Migration[5.2]
  def change
    change_column_default :tags, :pet_id, 'uuid_generate_v4()'
  end
end
