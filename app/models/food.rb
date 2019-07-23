class Food < ApplicationRecord
  belongs_to :restaurant
  has_many :daily_foods
end
