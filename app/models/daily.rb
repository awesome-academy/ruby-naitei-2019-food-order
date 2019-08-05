class Daily < ApplicationRecord
  belongs_to :restaurant
  has_many :daily_foods
  class << self
    def today
      Daily.find_by date: DateTime.now.to_date
    end
  end
end
