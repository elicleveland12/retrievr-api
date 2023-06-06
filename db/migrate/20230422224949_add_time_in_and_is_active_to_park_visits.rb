class AddTimeInAndIsActiveToParkVisits < ActiveRecord::Migration[7.0]
  def change
    add_column :park_visits, :time_in, :datetime
    add_column :park_visits, :is_active, :boolean
  end
end
