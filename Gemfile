source 'https://rubygems.org'
ruby '2.0.0'

gem 'rails', '4.0.3'
gem 'bootstrap-sass'
gem 'bcrypt-ruby'
gem 'faker'
gem 'will_paginate'
gem 'bootstrap-will_paginate'
gem 'clearance'
gem 'rake'
gem 'simplecov', :require => false, :group => :test

# Use postgress in all env
gem 'pg'


group :development do
  gem 'meta_request'
  gem 'nifty-generators'
  gem 'awesome_print'
end

gem 'activerecord-session_store', github: 'rails/activerecord-session_store'

group :development, :test do
  #gem 'sqlite3'
  gem 'rspec-rails'
  # The following optional lines are part of the advanced setup.
  gem 'guard-rspec'
  gem 'spork-rails'
  gem 'sprockets', '2.11.0'
  gem 'guard-spork'
  gem 'childprocess'
  gem 'factory_girl_rails'
end

group :test do
  gem 'selenium-webdriver'
  gem 'capybara'
  gem 'cucumber-rails', :require => false
  gem 'database_cleaner', github: 'bmabey/database_cleaner'

  # Uncomment this line on OS X.
  # gem 'growl', '1.0.3'

  # Uncomment these lines on Linux.
  # gem 'libnotify', '0.8.0'

  # Uncomment these lines on Windows.
  #gem 'rb-notifu', '0.0.4'
  #gem 'wdm', '0.1.0'
end

gem 'sass-rails'
gem 'uglifier'
gem 'coffee-rails'
gem 'jquery-rails'
gem 'turbolinks'
gem 'font-awesome-sass'
gem 'font-awesome-rails'
gem 'simple_form'

gem 'jbuilder'
# gem 'active_model_serializers', github: 'rails-api/active_model_serializers'
gem 'rabl'
# Also add either `oj` or `yajl-ruby` as the JSON parser
gem 'oj'

group :doc do
  gem 'sdoc', '0.3.20', require: false
  gem 'rdoc'
end

group :production do
  gem 'rails_12factor'
  gem 'rails_serve_static_assets'
end
