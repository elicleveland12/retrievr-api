class ChangeTagIdFkToString < ActiveRecord::Migration[7.0]
  def change
    change_column :pets, :tag_id, :string
    change_column :scans, :tag_id, :string
  end
end
