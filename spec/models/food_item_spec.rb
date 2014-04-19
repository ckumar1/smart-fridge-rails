require 'spec_helper'

describe FoodItem do
  let(:user) { FactoryGirl.create(:user, name: "crazydude", password: "ffffffff") }

  before { @fooditem = user.food_items.build(name: "Apple", expiration_date: Time.local(2014, 4, 17, 9, 10) ,user_id: user.id) }

  subject { @fooditem }

  it { should respond_to(:name) }
  it { should respond_to(:expiration_date)}
  it { should respond_to(:user_id) }
  it { should respond_to(:calories) }
  it { should respond_to(:description) }

  its(:user_id) { should eq user.id }

  it { should be_valid }

  describe "when user_id is not present" do
    before { @fooditem.user_id = nil }
    it { should_not be_valid }
  end

  describe "with no name" do
    before { @fooditem.name = " " }
    it { should_not be_valid }
  end

  describe "with content that is too long" do
    before { @fooditem.name = "a" * 141 }
    it { should_not be_valid }
  end
end
