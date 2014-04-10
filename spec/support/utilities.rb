def sign_in(user, options={})
  if options[:no_capybara]
    # Sign in when not using Capybara.
    remember_token = Clearance::Token.new
    cookies[:remember_token] = remember_token
    user.update_attribute(:remember_token, Clearance::Token.new)
  else
    visit sign_in_path
    fill_in "session_email",    with: user.email
    fill_in "session_password", with: user.password
    click_button "Login"
  end
end