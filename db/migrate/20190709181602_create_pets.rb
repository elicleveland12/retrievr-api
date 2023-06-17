class CreatePets < ActiveRecord::Migration[5.2]
  def change
    create_table :pets do |t|
      t.string :name
      t.string :birthdate
      t.boolean :missing, :default => false
      t.integer :poster_id
      t.uuid :user_id
      t.uuid :tag_id
      t.boolean :found, :default => false
      t.string :species
      t.string :sex
      t.string :breed_primary
      t.string :breed_secondary
      t.string :color_primary
      t.string :color_secondary
      t.string :color_tertiary
      t.text :description
      t.integer :temperment
      t.integer :energy_level
      t.integer :intelligence
      t.integer :protectiveness
      t.integer :sharing
      t.integer :height
      t.integer :weight

      t.timestamps
    end
  end
end
