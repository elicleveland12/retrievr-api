class PosterSerializer < ActiveModel::Serializer
  attributes :id, :lat, :long, :pet_description, :poster_name, :poster_phone, :found_lat, :found_long
  belongs_to :pet
end
