require 'spec_helper'

describe User do


  context 'Model' do
    it "responds to authenticate" do
      expect(User).to respond_to(:authenticate)
    end


    it "has a valid factory" do
      expect(FactoryGirl.build(:user)).to be_valid
    end
  end

  context 'Instance' do
    before { @user = User.new(name: 'Example User', email: 'user@example.com', password: 'fffffff', remember_token: 'ii', id: '1') }
    let (:valid_user) { build(:user) }
    subject { @user }

    describe 'responds to' do
      it { should respond_to(:name) }
      it { should respond_to(:email) }
      it { should respond_to(:password) }
      it { should respond_to(:remember_token) }
      it { should respond_to(:food_items) }
    end


    context 'is invalid' do
      let! (:valid_user) { build(:user, name: 'Example User', email: 'user@example.com', password: 'fffffff') }
      subject { @user }


      it "when name is too long" do
        valid_user.name = "a" * 51
        should_not be_valid
      end

      it "when email format is invalid" do
          addresses = %w[user@foo,com user_at_foo.org example.user@foo.
                     foo@bar_baz.com foo@bar+baz.com]
          addresses.each do |invalid_address|
            valid_user.email = invalid_address
            expect(valid_user).not_to be_valid
          end
        end


      it "when email address is already taken" do
        user_with_same_email = valid_user.dup
        user_with_same_email.save

        expect(valid_user).to_not be_valid
      end
    end

    describe 'is valid' do

      let(:user) { build(:user) }

      it "when email format is valid" do
        addresses = %w[user@foo.COM A_US-ER@f.b.org frst.lst@foo.jp a+b@baz.cn]
        addresses.each do |valid_address|
          user.email = valid_address
          expect(user).to be_valid
        end
      end
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
end
