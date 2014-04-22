require 'spec_helper'

feature 'Visitor signs up' do


  let (:valid) { build :user } # Valid Attributes
  let (:invalid) { build :user, name: '', email: 'invalid email', password: '' } # Invalid Attributes

  scenario 'by navigating to the page' do
    visit sign_in_path

    click_link I18n.t('sessions.form.sign_up')

    current_path.should eq sign_up_path
  end

  scenario 'with valid name, email and password' do
    #pending
    # TODO need to add field for name to sign up Form
    @user = sign_up_path(:name => 'coolz', :password => 'password', :email => 'coolz@cool.com')

    user_should_be_signed_in
  end

  scenario 'tries with invalid email' do
    sign_up_path(:name => 'coolz', :password => 'password', :email => 'coolz,@..jacool.com')

    user_should_be_signed_out
  end

  scenario 'tries with blank password' do
    sign_up_path(:name => 'coolz', :password => '', :email => 'coolz,@..jacool.com')

    user_should_be_signed_out
  end
end