class Bike < ApplicationRecord
    validates :make, :model, :year, presence: true
end
