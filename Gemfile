# frozen_string_literal: true

source "https://rubygems.org"

ruby '2.6.6'

gem 'rails', '4.2.10'
gem 'sqlite3', '~> 1.3.6'
gem 'sass-rails', '~> 5.0.3'
gem 'uglifier', '>= 2.7.1'
gem 'jquery-rails'
gem 'turbolinks'
# # Window support
# gem 'tzinfo'
# gem 'tzinfo-data', platforms: [:mingw, :mswin, :x64_mingw]

group :development, :test do
  # Call 'byebug' anywhere in the code to stop execution and get a debugger console
  gem 'byebug'
  gem 'rspec-rails', '3.7.2'
  gem 'capybara', '2.4.4'
  # gem 'guard-rspec'

  gem 'cucumber', '2.0.0'
  gem 'cucumber-rails', :require => false
  gem 'cucumber-rails-training-wheels'
  gem 'simplecov', '0.16.1', :require => false

  gem 'rspec', '>= 3.3.0'
  gem 'rspec-autotest', '1.0.0'

  gem 'rack-test', '0.6.3'
  gem 'rack_session_access', '0.1.1'

  gem 'launchy', '2.4.3'
  gem 'rerun', '0.10.0'

  gem 'webmock', '3.3.0'
  gem 'ZenTest', '4.11.2'

  # copied
  gem 'capybara', '2.4.4'
end

group :production do
  gem 'pg', '~> 0.21' # for Heroku deployment
  gem 'rails_12factor'
end
