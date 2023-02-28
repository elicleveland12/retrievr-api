class Tag < ApplicationRecord
    belongs_to :pet, optional: true
    has_many :scans
end
