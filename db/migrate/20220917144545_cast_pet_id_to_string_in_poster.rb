class CastPetIdToStringInPoster < ActiveRecord::Migration[6.0]
  def change
    change_column :posters, :pet_id, :string
  end
end
