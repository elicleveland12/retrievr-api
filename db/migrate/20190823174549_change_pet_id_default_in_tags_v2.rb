class ChangePetIdDefaultInTagsV2 < ActiveRecord::Migration[5.2]
  def change
    change_column_default :tags, :pet_id, 0
  end
end
