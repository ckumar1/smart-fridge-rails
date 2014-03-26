require 'spec_helper'

describe "Static pages" do

  describe "Home page" do

    it "should have the content 'Smart Fridge'" do
      visit '/static_pages/home'
      expect(page).to have_content('Smart Fridge')
    end

    it "should have the title 'Smart Fridge' "

  end
end