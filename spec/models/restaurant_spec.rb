require 'rails_helper'

RSpec.describe Restaurant, type: :model do
  before(:all) do
    @restaurant = create(:restaurant)
  end

  it "is valid with valid attributes" do
    expect(@restaurant).to be_valid
  end

  it "is not valid without a name" do
    error_restaurant_1 = create(:restaurant)
    error_restaurant_1.update_column(:name, nil)
    expect(error_restaurant_1).to_not be_valid
  end

  it "is not valid without a address" do
    error_restaurant_2 = create(:restaurant)
    error_restaurant_2.update_column(:address, nil)
    expect(error_restaurant_2).to_not be_valid
  end
end
