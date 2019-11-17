class Litter < ApplicationRecord
    has_many :pets
    belongs_to :breeder
end
