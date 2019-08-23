class ChangePetIdDefaultInTagsV4 < ActiveRecord::Migration[5.2]
  def change
    change_column_default :tags, :pet_id, nil
  end
end
