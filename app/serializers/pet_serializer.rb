class PetSerializer < ActiveModel::Serializer
  include Rails.application.routes.url_helpers
  attributes :id, :name, :breed, :instagram, :missing, :imageUrl, :birthdate, :found, :sold, :adopted, :species, :fixed, :price, :health, :sex, :number, :breeds, :colors, :size
  belongs_to :user
  belongs_to :litter
  has_many :posters
  has_many :tags

  def imageUrl
    if self.object.image.attached?
      self.object.image.service_url
    else
      nil
    end
  end

  def breeds
    breeds = {}
    breeds[:breed_primary] = self.object.breed_primary
    breeds[:breed_secondary] = self.object.breed_secondary
    breeds[:mixed] = self.object.mixed
    breeds[:unknown] = self.object.unknown
    breeds
  end

  def colors
    colors = {}
    colors[:color_primary] = self.object.color_primary
    colors[:color_secondary] = self.object.color_secondary
    colors[:color_teritary] = self.object.color_tertiary
    colors
  end
end
