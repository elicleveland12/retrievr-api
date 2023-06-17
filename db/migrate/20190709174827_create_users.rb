class CreateUsers < ActiveRecord::Migration[5.2]
  def change
    create_table :users do |t|
      t.string :name
      t.string :email
      t.string :password_digest
      t.string :phone
      t.string :location
      t.integer :finder_radius
      t.boolean :email_confirmed, default: false
      t.string :confirm_token
      t.string :country
      t.integer :referral_id
      t.float :latitude
      t.float :longitude
      t.integer :reset_password_token

      t.timestamps
    end
  end
end
