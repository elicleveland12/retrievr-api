class PosterSerializer < ActiveModel::Serializer
  attributes :id, :lat, :long, :pet_description, :poster_name, :poster_phone, :found_lat, :found_long, :missing_time, :comment
  belongs_to :pet
end
