class Pet < ApplicationRecord
    include Rails.application.routes.url_helpers
    has_one_attached :image
    belongs_to :user, optional: true
    has_many :posters
    has_many :tags
    has_many :park_visits
    has_many :scans, through: :tags

    def imageUrl
        if image.attached?
            url_for(image)
        else
            "https://media.istockphoto.com/id/1147544807/vector/thumbnail-image-vector-graphic.jpg?s=612x612&w=0&k=20&c=rnCKVbdxqkjlcs3xH87-9gocETqpspHFXu5dIGB4wuM="
        end
    end

end
