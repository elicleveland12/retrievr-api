class CreateDevices < ActiveRecord::Migration[5.2]
  def change
    create_table :devices do |t|
      t.integer :user_id
      t.string :token
      t.string :platform
      t.timestamps
    end
  end
end
