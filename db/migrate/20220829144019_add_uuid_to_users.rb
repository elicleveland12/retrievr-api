class AddUuidToUsers < ActiveRecord::Migration[6.0]
  def change
    add_column :users, :uuid, :uuid, default: "uuid_generate_v4()", null: false

    change_table :users do |t|
      t.remove :id
      t.rename :uuid, :id
    end
  end
end
