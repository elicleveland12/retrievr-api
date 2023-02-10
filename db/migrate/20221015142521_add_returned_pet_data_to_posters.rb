class AddReturnedPetDataToPosters < ActiveRecord::Migration[6.0]
  def change
    add_column :posters, :returned, :boolean, :default => false
    add_column :posters, :returned_state, :string
    add_column :posters, :returned_comment, :string
    add_column :posters, :returned_timestamp, :string
  end
end
