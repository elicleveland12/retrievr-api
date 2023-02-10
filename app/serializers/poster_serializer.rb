class PosterSerializer < ActiveModel::Serializer
  attributes :id, :latitude, :longitude, :address, :pet_description, :poster_name, :poster_phone, :found_lat, :found_long, :missing_time, :comment, :additional_info, :reward, :status, :returned, :returned_state, :returned_comment, :returned_timestamp
  belongs_to :pet
  has_many :messages
end
