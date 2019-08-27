class UserSerializer < ActiveModel::Serializer
  attributes :id, :name, :email, :password, :phone, :location, :finder_radius
  has_many :pets
end
