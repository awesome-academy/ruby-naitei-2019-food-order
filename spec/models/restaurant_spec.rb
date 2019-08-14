require 'rails_helper'

RSpec.describe Restaurant, type: :model do
  before(:all) do
    @restaurant = create(:restaurant)
  end
end
