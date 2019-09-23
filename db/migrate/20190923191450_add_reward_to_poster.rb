class AddRewardToPoster < ActiveRecord::Migration[5.2]
  def change
    add_column :posters, :reward, :string
  end
end
