class ScanSerializer < ActiveModel::Serializer
  include Rails.application.routes.url_helpers
  attributes :id, :user_id, :tag_id, :count, :scanned_pet
  belongs_to :tag

  def scanned_pet
    tag = Tag.find(self.object.tag_id)
    scanned_pet = {}
    pet = Pet.find(tag.pet_id)
    scanned_pet[:imageUrl] = url_for(pet.image)
    scanned_pet[:id] = tag.pet_id
    scanned_pet[:missing] = pet.missing
    scanned_pet[:species] = pet.species
    scanned_pet[:owner_id] = pet.user.id
    scanned_pet
  end

end
