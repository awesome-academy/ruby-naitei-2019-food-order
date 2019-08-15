require 'rails_helper'

RSpec.describe Daily, type: :model do
  before(:all) do
    @restaurant = create(:restaurant)
    @daily = create(:daily, restaurant_id: @restaurant.id)
  end

  it "is valid with valid attributes" do
    expect(@daily).to be_valid
  end

  it "is not valid without a start time order" do
    error_daily_1 = create(:daily, restaurant_id: @restaurant.id)
    error_daily_1.update_column(:start_time_order, nil)
    expect(error_daily_1).to_not be_valid
  end

  it "is not valid without a end time order" do
    error_daily_2 = create(:daily, restaurant_id: @restaurant.id)
    error_daily_2.update_column(:end_time_order, nil)
    expect(error_daily_2).to_not be_valid
  end

  it "is not valid without end time order greater than start time order" do
    error_daily_3 = create(:daily, restaurant_id: @restaurant.id)
    error_daily_3.update_column(:end_time_order, DateTime.now - 1.minute)
    expect(error_daily_3).to_not be_valid
  end
end
