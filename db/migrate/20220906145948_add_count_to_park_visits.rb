class AddCountToParkVisits < ActiveRecord::Migration[6.0]
  def change
    add_column :park_visits, :count, :integer
  end
end
