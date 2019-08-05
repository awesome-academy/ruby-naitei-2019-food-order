class Food < ApplicationRecord
  belongs_to :restaurant
  has_many :daily_foods
  has_many :food_images
  has_many :user_favorite_foods
  has_many :comments
  accepts_nested_attributes_for :food_images
end
