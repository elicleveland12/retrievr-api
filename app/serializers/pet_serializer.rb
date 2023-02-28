class PetSerializer < ActiveModel::Serializer
  include Rails.application.routes.url_helpers
  attributes :id, :name, :instagram, :missing, :imageUrl, :birthdate, :found, :species, :sex, :breeds, :colors, :qualities, :description, :height, :weight
  belongs_to :user
  has_many :posters
  has_many :tags
  has_many :park_visits

  def imageUrl
    if self.object.image.attached?
      url_for(self.object.image)
    else
      nil
    end
  end

  def breeds
    breeds = {}
    breeds[:breed_primary] = self.object.breed_primary
    breeds[:breed_secondary] = self.object.breed_secondary
    breeds
  end

  def colors
    colors = {}
    colors[:color_primary] = self.object.color_primary
    colors[:color_secondary] = self.object.color_secondary
    colors[:color_teritary] = self.object.color_tertiary
    colors
  end

  def qualities
    qualities = {}
    qualities[:energy_level] = self.object.energy_level
    qualities[:intelligence] = self.object.intelligence
    qualities[:temperment] = self.object.temperment
    qualities[:protectiveness] = self.object.protectiveness
    qualities[:sharing] = self.object.sharing
    qualities
  end

end
