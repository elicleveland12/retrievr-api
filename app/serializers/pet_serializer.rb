class PetSerializer < ActiveModel::Serializer
  include Rails.application.routes.url_helpers
  attributes :id, :name, :breed, :instagram, :missing, :imageUrl
  belongs_to :user
  has_many :posters
  has_many :tags

  def imageUrl
    self.object.photo.service_url
  end
end
p