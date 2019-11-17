class PetSerializer < ActiveModel::Serializer
  include Rails.application.routes.url_helpers
  attributes :id, :name, :breed, :instagram, :missing, :imageUrl, :birthdate, :found, :sold, :adopted, :species, :fixed, :price, :health, :color, :sex, :number
  belongs_to :user
  belongs_to :litter
  belongs_to :shelter
  has_many :posters
  has_many :tags

  def imageUrl
    if self.object.image.attached?
      self.object.image.service_url
    else
      nil
    end
  end
end
