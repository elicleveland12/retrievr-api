class ParkVisitSerializer < ActiveModel::Serializer
  attributes :id, :park_id, :pet_id, :count
end
