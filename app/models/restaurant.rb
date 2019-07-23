class Restaurant < ApplicationRecord
  has_many :foods
  has_many :dailies
end
