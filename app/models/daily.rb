class Daily < ApplicationRecord
  belongs_to :restaurant
  has_many :daily_foods

  validates :start_time_order, presence: true
  validates :end_time_order, presence: true, date: {after: :start_time_order}

  class << self
    def today
      Daily.find_by date: DateTime.now.to_date
    end
  end
end
