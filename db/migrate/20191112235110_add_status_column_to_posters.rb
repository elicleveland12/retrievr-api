class AddStatusColumnToPosters < ActiveRecord::Migration[5.2]
  def change
    add_column :posters, :status, :boolean, :default => true
  end
end
