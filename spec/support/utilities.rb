def sign_in(user, options={})
  if options[:no_capybara]
    # Sign in when not using Capybara.
    remember_token = User.generate_remember_token
    cookies[:remember_token] = remember_token
    user.update_attribute(:remember_token, Clearance::Token.new)
  else
    visit sign_in_path
    fill_in "Email",    with: user.email
    fill_in "Password", with: user.password
    click_button "Sign in"
  end
end