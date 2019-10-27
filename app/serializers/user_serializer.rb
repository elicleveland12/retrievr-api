class UserSerializer < ActiveModel::Serializer
  attributes :id, :name, :email, :password, :phone, :location, :finder_radius, :email_confirmed
  has_many :pets
end
