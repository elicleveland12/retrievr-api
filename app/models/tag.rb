class Tag < ApplicationRecord
    belongs_to :pet, optional: true
end
