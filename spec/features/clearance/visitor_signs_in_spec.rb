require 'spec_helper'

feature 'Visitor signs in' do
  scenario 'with valid email and password' do
    create_user 'valid name', 'user@example.com', 'password'
    sign_in_with 'user@example.com', 'password'

    user_should_be_signed_in
  end

  scenario 'with valid mixed-case email and password ' do
    create_user 'valid name', 'user.name@example.com', 'password'
    sign_in_with 'User.Name@example.com', 'password'

    user_should_be_signed_in
  end

  scenario 'tries with invalid password' do
    create_user 'valid name', 'user@example.com', 'password'
    sign_in_with 'user@example.com', 'wrong_password'

    page_should_display_sign_in_error
    user_should_be_signed_out
  end

  scenario 'tries with invalid email' do
    sign_in_with 'unknown.email@example.com', 'password'

    page_should_display_sign_in_error
    user_should_be_signed_out
  end

  private

  def create_user(name, email, password)
    create(:user, name: name, email: email, password: password)
  end

  def page_should_display_sign_in_error
    page.body.should include(
      '-Bad email or password.'
    )
  end
end
