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

  it { should respond_to(:user) }
  its(:user) { should == user }

  it { should be_valid }

  describe "when user_id is not present" do
    before { @fooditem.user_id = nil }
    it { should_not be_valid }
  end

  describe "with no name" do
    before { @fooditem.name = "" }
    it { should_not be_valid }
  end

  describe "with name that is too long" do
    before { @fooditem.name = "a" * 41 }
    it { should_not be_valid }
  end

  describe "accessible attributes" do
    it "should not allow access to user_id" do
      expect do
        FoodItem.new(user_id: user.id)
      end.to raise_error
    end

    before {subject.user_id = 99}
    its(:user_id) { should_not == 99 }
    its(:user_id) { should == user.id}

  end

end
