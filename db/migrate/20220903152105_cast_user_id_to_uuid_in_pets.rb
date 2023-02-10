class CastUserIdToUuidInPets < ActiveRecord::Migration[6.0]
  def change
    change_column :pets, :user_id, :string
  end
end
