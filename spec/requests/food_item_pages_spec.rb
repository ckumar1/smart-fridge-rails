require 'spec_helper'

describe "Food Item pages" do

  subject { page }

  let!(:user) { FactoryGirl.create(:user) }
  before { log_in_as user, no_capybara: true }

  describe "food item creation" do
    before do
      visit 'food_items/food'
    end

    describe "with invalid information" do

      it "should not create a food item" do
        expect { click_button "Post" }.not_to change(FoodItem, :count)
      end

      describe "error messages" do
        before { click_button "Post" }
        it { should have_content('error') }
      end
    end

    describe "with valid information" do

      before { fill_in 'food item_content', with: "Lorem ipsum" }
      before { fill_in 'food item_content', with: "Lorem ipsum" }
      it "should create a food item" do
        expect { click_button "Post" }.to change(FoodItem, :count).by(1)
      end
    end
  end
end