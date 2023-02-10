class CreateParkVisits < ActiveRecord::Migration[6.0]
  def change
    create_table :park_visits do |t|
      t.integer :park_id
      t.string :pet_id

      t.timestamps
    end
  end
end
