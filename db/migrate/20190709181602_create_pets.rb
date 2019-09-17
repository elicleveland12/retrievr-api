class CreatePets < ActiveRecord::Migration[5.2]
  def change
    create_table :pets do |t|
      t.string :name
      t.string :breed
      t.string :instagram
      t.datetime :birthdate
      t.boolean :missing, :default => false
      t.integer :poster_id
      t.integer :user_id
      t.integer :tag_id

      t.timestamps
    end
  end
end
