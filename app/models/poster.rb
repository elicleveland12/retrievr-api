class Poster < ApplicationRecord
    belongs_to :pet
    has_many :messages
    reverse_geocoded_by :latitude, :longitude,
      :address => :location
    # after_validation :reverse_geocode
end
