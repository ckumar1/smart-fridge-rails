require 'spec_helper'

describe User do

  before { @user = User.new(name: "Example User", email: "user@example.com", password: "fffffff", remember_token: "ii", id: "1") }

  subject { @user }

  it { should respond_to(:name) }
  it { should respond_to(:email) }
  it { should respond_to(:password) }
  it { should respond_to(:remember_token) }
  it { should respond_to(:food_items) }

  it "should " do

  end ""
  respond_to(:authenticate)}
end

it "has a valid factory" do
  expect(FactoryGirl.build(:user)).to be_valid
end

describe "when name is too long" do
    before { @user.name = "a" * 51 }
    it { should_not be_valid }
  end
  describe "when email format is invalid" do
    it "should be invalid" do
      addresses = %w[user@foo,com user_at_foo.org example.user@foo.
                     foo@bar_baz.com foo@bar+baz.com]
      addresses.each do |invalid_address|
        @user.email = invalid_address
        expect(@user).not_to be_valid
      end
    end
  end

  describe "when email format is valid" do
    it "should be valid" do
      addresses = %w[user@foo.COM A_US-ER@f.b.org frst.lst@foo.jp a+b@baz.cn]
      addresses.each do |valid_address|
        @user.email = valid_address
        @user.name = "cool_dude"
        @user.password = "ffffffff"
        expect(@user).to be_valid
      end
    end
  end
  describe "when email address is already taken" do
    before do
      user_with_same_email = @user.dup
      user_with_same_email.save
    end

    it { should_not be_valid }
  end
  describe "remember token" do
    before { @user.save }
    its(:remember_token) { should_not be_blank }
  end
  describe "FoodItem associations" do

    before { @user.save }
    let!(:older_food_item) do
      FactoryGirl.create(:food_item, name: "Apple", expiration_date: Time.local(2014, 4, 17, 9, 10), user_id: @user.id)
    end
    let!(:newer_food_item) do
      FactoryGirl.create(:food_item, name: "Appleede", expiration_date: Time.local(2014, 4, 17, 9, 10), user_id: @user.id)
    end

    it "should have the right exipration dates in the right order" do
      expect(@user.food_items.to_a).to eq [newer_food_item, older_food_item]
    end
  end
end
