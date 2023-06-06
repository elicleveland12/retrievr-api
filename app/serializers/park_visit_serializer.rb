class ParkVisitSerializer < ActiveModel::Serializer
  include Rails.application.routes.url_helpers
  attributes :id, :park_id, :pet_id, :count, :time_in, :is_active, :active_pet

  def active_pet
    pet = Pet.find(self.object.pet_id)
    active_pet = {}
    active_pet[:id] = pet.id
    active_pet[:imageUrl] = url_for(pet.image)
    active_pet[:name] = pet.name
    active_pet[:scans] = pet.scans
    active_pet
  end
end
