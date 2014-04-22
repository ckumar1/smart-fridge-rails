require 'spec_helper'

describe "User pages" do

  subject { page }

  describe "signup page" do
    before { visit sign_up_path }

    it { page.should have_css('#user_name') }
  end
  describe "user page" do
    let(:user) { FactoryGirl.create(:user, name: "crazydude", password: "ffffffff") }
    let!(:food_item) { FactoryGirl.create(:food_item, name: "Apple", expiration_date: Time.local(2014, 4, 17) ,user_id: user.id)  }
    let!(:food_item2) do
      FactoryGirl.create(:food_item, name: "Banana", expiration_date: Time.local(2014, 4, 18), user_id: user.id)
    end
    let(:recipe) { FactoryGirl.create(:recipe, name: "Banana Bread", directions: "Preheat to 400 degrees" ,user_id: user.id) }
    before { visit user_path(user) }

    it { should have_content(user.name) }
    it { should have_title(user.name) }
    describe "fooditems" do
      it { should have_content(food_item.name) }
      it { should have_content(food_item2.name) }
      it { should have_content(user.food_items.count) }
    end
  end
  describe "edit" do
    let(:user) { FactoryGirl.create(:user, name: "crazydude", password: "ffffffff") }
    before do
      sign_in_user(user, options={})
      visit edit_user_path(user)
    end

    describe "with invalid information" do
      before { click_button 'submit' }

      it { should have_content('success') }
    end
    describe "with valid information" do
      let(:new_name)  { "New Name" }
      let(:new_email) { "new@example.com" }
      before do
      fill_in "#user_name",            with: new_name
      fill_in "user_email",            with: new_email
      fill_in "user_password",         with: user.password
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