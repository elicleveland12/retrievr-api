class UserSerializer < ActiveModel::Serializer
  attributes :id, :name, :email, :password, :phone, :location, :finder_radius, :email_confirmed, :country
  has_many :pets
end
