require 'spec_helper'
require 'clearance/testing/helpers'


describe "User pages", type: :feature do

  subject { page }

  describe "signup page" do
    before { visit sign_up_path }

    it { should have_content('Create a new SmartFridge Account!') }
  end

  describe "user page" do
    let(:user) { FactoryGirl.create(:user ) }
    let!(:food1) { FactoryGirl.create(:food_item, user: user ) }
    let!(:food2) { FactoryGirl.create(:food_item, name: "Banana", expiration_date: Time.local(2014, 4, 18, 9, 10), user: user) }
    let!(:recipe1) {FactoryGirl.create(:recipe, user: user)}

    before { visit user_path(user) }

    it { should have_content(user.name) }
    it { should have_title(user.name) }

    describe "fooditems" do
      it { should have_content(food1.name) }
      it { should have_content(food2.name) }
      it { should have_content(food1.expiration_date) }
      it { should have_content(food2.expiration_date) }
      it { should have_content(user.food_items.count) }
    end


    describe "recipes" do
      it { should have_content(recipe1.name) }
      it { should have_content(recipe1.ingredients) }
      it { should have_content(user.recipes.count) }
    end

  end
  describe "edit" do
    password = 'password123'
    let!(:user) { FactoryGirl.create(:user, password: password) }
    before do
      log_in_as user
      visit edit_user_path(user)
      save_and_open_page 'edit_user.html'
    end

    describe "with invalid information" do
      before do
        visit edit_user_path(user)
        save_and_open_page
        # Capybara's Click button not able to find the submit button
        click_button "submit"
        assert_template "edit"
      end

      it { should have_content('success') }
    end
    describe "with valid information" do
      let(:new_name)  { "New Name" }
      let(:new_email) { "new@example.com" }
      before do
      save_and_open_page
      fill_in  "user_name",             with: new_name
      fill_in "user_email",            with: new_email
      fill_in "user_password",         with: user.password
      # Capybara's Click button not able to find the submit button
      click_button "Save changes"
      end
      it { should have_link('Sign out') }
      it { should have_title(new_name) }
      it { should have_selector('div.alert.alert-success') }
      specify { expect(user.reload.name).to  eq new_name }
      specify { expect(user.reload.email).to eq new_email }
    end
  end
end