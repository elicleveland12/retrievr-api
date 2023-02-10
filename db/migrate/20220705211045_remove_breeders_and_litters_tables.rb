class RemoveBreedersAndLittersTables < ActiveRecord::Migration[6.0]
  def change
    drop_table :breeders
    drop_table :litters 
  end
end
