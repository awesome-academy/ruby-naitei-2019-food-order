require 'rails_helper'

RSpec.describe Comment, type: :model do
  before(:all) do
    @user = create(:user, first_name: "John", last_name: "Price", email: "john.price@sun-asterisk.com")
    @restaurant = create(:restaurant)
    @food = create(:food, restaurant_id: @restaurant.id)
    @comment = create(:comment, user_id: @user.id, food_id: @food.id)
  end

  it "is valid with valid attributes" do
    expect(@comment).to be_valid
  end

  it "is not valid with blank comment" do
    error_comment_1 = create(:comment, user_id: @user.id, food_id: @food.id)
    error_comment_1.update_column(:comment, nil)
    expect(error_comment_1).to_not be_valid
  end
end
