class CreateParkVisits < ActiveRecord::Migration[6.0]
  def change
    create_table :park_visits do |t|
      t.string :park_id
      t.integer :pet_id
      t.integer :count
      t.datetime :time_in
      t.boolean :is_active

      t.timestamps
    end
  end
end
