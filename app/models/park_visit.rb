class ParkVisit < ApplicationRecord
  belongs_to :park
  belongs_to :pet
end
