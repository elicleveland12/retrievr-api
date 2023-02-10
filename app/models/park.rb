class Park < ApplicationRecord
  has_many :tags
  has_many :park_visits
end
