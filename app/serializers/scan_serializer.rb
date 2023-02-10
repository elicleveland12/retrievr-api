class ScanSerializer < ActiveModel::Serializer
  attributes :id, :user_id, :tag_id, :scanned_pet
  belongs_to :tag

  def scanned_pet
    tag = Tag.find(self.object.tag_id)
    if tag.tag_type == "pet"
      scanned_pet = {}
      pet = Pet.find(tag.pet_id)
      scanned_pet[:imageUrl] = pet.image.service_url
      scanned_pet[:id] = tag.pet_id
      scanned_pet[:missing] = pet.missing
      scanned_pet[:species] = pet.species
      scanned_pet
    end
  end

end
