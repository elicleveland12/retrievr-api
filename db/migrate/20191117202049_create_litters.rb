class CreateLitters < ActiveRecord::Migration[5.2]
  def change
    create_table :litters do |t|
      t.string :bitch
      t.string :stud
      t.string :breed
      t.string :due_date
      t.integer :breeder_id

      t.timestamps
    end
  end
end
