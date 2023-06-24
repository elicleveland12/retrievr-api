class ChangeTagIdToString < ActiveRecord::Migration[7.0]
  def change
    change_column_default :tags, :id, nil

    change_column :tags, :id, :string
  end
end
