class ChangeParkIdToStringInParkVisits < ActiveRecord::Migration[7.0]
  def change
    change_column :park_visits, :park_id, :string
  end
end
