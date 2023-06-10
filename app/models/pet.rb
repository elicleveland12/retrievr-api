class Pet < ApplicationRecord
    has_one_attached :image
    belongs_to :user, optional: true
    has_many :posters
    has_many :tags
    has_many :park_visits
    has_many :scans, through: :tags
end
