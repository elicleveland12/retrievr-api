class UpdateBirthdateToStringFromPet < ActiveRecord::Migration[5.2]
  def change
    change_column :pets, :birthdate, :string
  end
end
