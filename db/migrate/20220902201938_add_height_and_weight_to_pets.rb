class AddHeightAndWeightToPets < ActiveRecord::Migration[6.0]
  def change
    add_column :pets, :height, :integer
    add_column :pets, :weight, :integer
  end
end
