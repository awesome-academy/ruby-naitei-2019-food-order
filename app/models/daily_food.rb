class DailyFood < ApplicationRecord
  belongs_to :user
  belongs_to :daily
  belongs_to :food
end
