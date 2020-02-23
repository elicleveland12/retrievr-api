class UserSerializer < ActiveModel::Serializer
  attributes :id, :name, :email, :password, :phone, :location, :finder_radius, :email_confirmed, :country, :number_of_referred_users
  has_many :pets

  def number_of_referred_users
    User.where(referral_id: self.object.id).count
  end
end
