require 'spec_helper'

describe FoodItem do
  let(:user) { FactoryGirl.create(:user) }
  before do
    # This code is not idiomatically correct.
    @fooditem = FoodItem.new(name: "Apple", expiration_date: "April 17, 2014" ,user_id: user.id)
  end

  subject { @fooditem }

  it { should respond_to(:name) }
  it { should respond_to(:expiration_date)}
  it { should respond_to(:user_id) }
end
