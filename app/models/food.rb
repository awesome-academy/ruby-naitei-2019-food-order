class Food < ApplicationRecord
  belongs_to :restaurant
  has_many :daily_foods
  has_many :food_images
  accepts_nested_attributes_for :food_images
end
