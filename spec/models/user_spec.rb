require 'rails_helper'

RSpec.describe User, type: :model do
  before(:all) do
    @user1 = create(:user, first_name: "John", last_name: "Price")
    @user2 = create(:user, first_name: "Abraham", last_name: "Lincoln")
    @user3 = create(:user, first_name: "Bill", last_name: "Foster")
    @user4 = create(:user, first_name: "John", last_name: "Doe")
  end

  it "return a sorted by name array of result that match" do
    User.order_by_name.should == [@user2, @user3, @user4, @user1]
  end
    
  it "is valid with valid attributes" do
    expect(@user1).to be_valid
  end

  it "is not valid without a probably email" do
    @user2.update_column(:email, "makarov@gmail.com")
    expect(@user2).to_not be_valid
  end
end
