class Restaurant < ApplicationRecord
  has_many :foods
  has_many :dailies

  private

  def self.inheritance_column
    nil
  end
end
