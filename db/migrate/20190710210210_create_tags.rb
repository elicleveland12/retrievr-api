class CreateTags < ActiveRecord::Migration[5.2]
  def change
    create_table :tags, id: :uuid, default: "uuid_generate_v4()" do |t|
      t.boolean :active, :default => false
      t.integer :pet_id
      t.string :tag_type

      t.timestamps
    end
  end
end
