class PetSerializer < ActiveModel::Serializer
  include Rails.application.routes.url_helpers
  attributes :id, :name, :breed, :instagram, :missing, :imageUrl
  belongs_to :user
  has_many :posters
  has_many :tags

  def imageUrl
    self.object.image.service_url
  end
end