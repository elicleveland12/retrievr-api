class CreateScans < ActiveRecord::Migration[6.0]
  def change
    create_table :scans do |t|
      t.string :user_id
      t.string :tag_id

      t.timestamps
    end
  end
end
