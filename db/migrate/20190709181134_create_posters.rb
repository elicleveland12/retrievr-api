class CreatePosters < ActiveRecord::Migration[5.2]
  def change
    create_table :posters do |t|
      t.float :latitude
      t.float :longitude
      t.integer :pet_id
      t.string :pet_description
      t.string :poster_name
      t.string :poster_phone
      t.string :found_lat
      t.string :found_long
      t.string :comment
      t.string :missing_time
      t.string :additional_info
      t.integer :message_id
      t.string :reward
      t.boolean :status, default: true
      t.boolean :returned, default: false
      t.string :returned_state
      t.string :returned_comment
      t.string :returned_timestamp
      t.string :address      

      t.timestamps
    end
  end
end
