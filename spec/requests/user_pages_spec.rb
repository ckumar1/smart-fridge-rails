require 'spec_helper'

describe "User pages" do

  subject { page }

  describe "signup page" do
    before { visit sign_up_path }

    it { should have_content('Sign Up') }
  end
  describe "user page" do
    let(:user) { FactoryGirl.create(:user, name: "crazydude", password: "ffffffff") }
    let!(:food1) { FactoryGirl.create(:food_item, name: "Apple", expiration_date: Time.local(2014, 4, 17, 9, 10) ,user_id: @user.id ) }
    let!(:food2) { FactoryGirl.create(:food_item, name: "Banana", expiration_date: Time.local(2014, 4, 18, 9, 10) ,user_id: @user.id ) }
    before { visit user_path(user) }

    it { should have_content(user.name) }
    it { should have_title(user.name) }
    describe "fooditems" do
      it { should have_content(food1.content) }
      it { should have_content(food2.content) }
      it { should have_content(user.food_items.count) }
    end
  end
  describe "edit" do
    let(:user) { FactoryGirl.create(:user, name: "crazydude", password: "ffffffff") }
    before do
      sign_in(user, options={})
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
      fill_in  :name ,             with: new_name
      fill_in "user_email",            with: new_email
      fill_in "user_password",         with: user.password
        #click_button "Save changes"
      end
      it { should have_link('Sign out') }
      it { should have_title(new_name) }
      it { should have_selector('div.alert.alert-success') }
      specify { expect(user.reload.name).to  eq new_name }
      specify { expect(user.reload.email).to eq new_email }
    end
  end
end