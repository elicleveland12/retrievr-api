class AddTagIdToPark < ActiveRecord::Migration[6.0]
  def change
    add_column :parks, :tag_id, :string
  end
end
