class CreateBreeders < ActiveRecord::Migration[5.2]
  def change
    create_table :breeders do |t|
      t.string :name
      t.string :location
      t.string :breeds
      t.string :litters_to_date
      t.boolean :verified, :default => false
      t.string :champ_bloodlines   
      t.integer :breeder_id   

      t.timestamps
    end
  end
end
