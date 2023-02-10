class CreateParks < ActiveRecord::Migration[6.0]
  def change
    create_table :parks do |t|
      t.float :latitude
      t.float :longitude
      t.string :address
      t.string :name
      t.text :description
      t.string :hours_sunday
      t.string :hours_monday
      t.string :hours_tuesday
      t.string :hours_wednesday
      t.string :hours_thursday
      t.string :hours_friday
      t.string :hours_saturday

      t.timestamps
    end
  end
end
