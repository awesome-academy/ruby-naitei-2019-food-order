require 'rails_helper'

RSpec.describe DailyFood, type: :model do
  before(:all) do
    @daily_food = create(:daily_food)
  end
end
