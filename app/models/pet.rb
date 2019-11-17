class Pet < ApplicationRecord
    has_one_attached :image
    belongs_to :user
    belongs_to :litter
    belongs_to :shelter
    has_many :posters
    has_many :tags
end
