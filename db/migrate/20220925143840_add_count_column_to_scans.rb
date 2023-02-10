class AddCountColumnToScans < ActiveRecord::Migration[6.0]
  def change
    add_column :scans, :count, :integer
  end
end
