class CreateScans < ActiveRecord::Migration[6.0]
  def change
    create_table :scans do |t|
      t.uuid :user_id
      t.uuid :tag_id
      t.integer :count

      t.timestamps
    end
  end
end
