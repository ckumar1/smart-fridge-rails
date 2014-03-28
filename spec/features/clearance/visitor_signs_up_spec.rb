require 'spec_helper'

feature 'Visitor signs up' do

  let (:valid_user) { build :user }
  let (:invalid_user) { build :user, name: '', email: 'invalid email', password: '' }

  scenario 'by navigating to the page' do
    visit sign_in_path

    click_link I18n.t('sessions.form.sign_up')

    current_path.should eq sign_up_path
  end

  scenario 'with valid name, email and password' do
    #pending
    # TODO need to add field for name to sign up Form
    sign_up_with valid_user.name, valid_user.email, valid_user.password

    user_should_be_signed_in
  end

  scenario 'tries with invalid email' do
    sign_up_with invalid_user.email, valid_user.password

    user_should_be_signed_out
  end

  scenario 'tries with blank password' do
    sign_up_with 'valid@example.com', ''

    user_should_be_signed_out
  end
end