require 'rails_helper'

RSpec.describe Food, type: :model do
  before(:all) do
    @food = create(:food)
  end
end
