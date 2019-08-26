class Poster < ApplicationRecord
    belongs_to :pet
    has_many :messages
end
