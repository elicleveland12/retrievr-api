class AddParkIdAndTagTypeToTag < ActiveRecord::Migration[6.0]
  def change
    add_column :tags, :park_id, :integer
    add_column :tags, :tag_type, :string
  end
end
