require 'rails_helper'

RSpec.describe Comment, type: :model do
  before(:all) do
    @comment = create(:comment)
  end
end
