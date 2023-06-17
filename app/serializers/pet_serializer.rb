class PetSerializer < ActiveModel::Serializer
  attributes :id, :name, :missing, :imageUrl, :birthdate, :found, :species, :sex, :breeds, :colors, :qualities, :description, :height, :weight, :inPark, :sorted_park_visits, :total_scans, :activeParkId
  belongs_to :user
  has_many :posters
  has_many :tags
  has_many :park_visits
  has_many :scans, through: :tags

  def sorted_park_visits
    self.object.park_visits.order(is_active: :asc)
  end

  def total_scans
    total_scans = 0
    self.object.scans.each do |scan|
      total_scans += scan.count.to_i if scan.count.present?
    end
    total_scans
  end

  def inPark
    inPark = false
    inParkObject = self.object.park_visits.where(is_active: true)
    if inParkObject.length > 0
      inPark = true
    end
    inPark
  end

  def activeParkId
    activeParkId = nil
    inParkObject = self.object.park_visits.where(is_active: true)
    if inParkObject.length > 0
      activeParkId = inParkObject[0].park_id
    end
    activeParkId
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
    colors[:color_tertiary] = self.object.color_tertiary
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
