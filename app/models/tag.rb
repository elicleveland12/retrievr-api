class Tag < ApplicationRecord
    belongs_to :pet, optional: true
    belongs_to :park, optional: true
    has_many :scans
end
