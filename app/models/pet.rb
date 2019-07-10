class Pet < ApplicationRecord
    has_one_attached :image
    belongs_to :user
    has_many :posters
    has_many :tags
end
