class AddAdditionalInfoToPoster < ActiveRecord::Migration[5.2]
  def change
    add_column :posters, :additional_info, :string
    add_column :posters, :message_id, :integer
  end
end
