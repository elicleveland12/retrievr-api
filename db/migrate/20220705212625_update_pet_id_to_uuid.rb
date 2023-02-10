class UpdatePetIdToUuid < ActiveRecord::Migration[6.0]
  def change
    add_column :pets, :uuid, :uuid, default: "uuid_generate_v4()", null: false

    change_table :pets do |t|
      t.remove :id
      t.rename :uuid, :id
    end
  end
end
