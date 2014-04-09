require 'spec_helper'

describe "User pages" do

  subject { page }

  describe "signup page" do
    before { visit sign_up_path }

    it { should have_content('Sign Up') }
  end
  describe "user page" do
    let(:user) { FactoryGirl.create(:user, name: "crazydude") }
    before { visit user_path(user) }

    it { should have_content(user.name) }
    it { should have_title(user.name) }
  end
  describe "edit" do
    let(:user) { FactoryGirl.create(:user, name: "crazydude") }
    before { visit edit_user_path(user) }

    describe "with invalid information" do
      before { click_button 'Save changes' }

      it { should have_content('success') }
    end
    describe "with valid information" do
      let(:new_name)  { "New Name" }
      let(:new_email) { "new@example.com" }
      before do
      fill_in "#user_name",      with: new_name
      fill_in "Email",            with: new_email
      fill_in "Password",         with: user.password
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