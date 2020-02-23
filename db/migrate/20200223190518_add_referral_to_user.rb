class AddReferralToUser < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :referral_id, :integer
  end
end
