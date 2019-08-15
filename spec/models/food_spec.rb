require 'rails_helper'

RSpec.describe Food, type: :model do
  before(:all) do
    @restaurant = create(:restaurant)
    @food = create(:food, restaurant_id: @restaurant.id)
  end

  it "is valid with valid attributes" do
    expect(@food).to be_valid
  end

  it "is not valid without a name" do
    error_food_1 = create(:food, restaurant_id: @restaurant.id)
    error_food_1.update_column(:name, nil)
    expect(error_food_1).to_not be_valid
  end

  it "is not valid without a type" do
    error_food_2 = create(:food, restaurant_id: @restaurant.id)
    error_food_2.update_column(:type, nil)
    expect(error_food_2).to_not be_valid
  end

  it "is not valid without a description" do
    error_food_3 = create(:food, restaurant_id: @restaurant.id)
    error_food_3.update_column(:description, nil)
    expect(error_food_3).to_not be_valid
  end
end
