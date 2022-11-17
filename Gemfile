source "https://rubygems.org"

ruby '2.6.6'

gem 'rails', '4.2.10'
gem 'sass-rails', '~> 5.0.3'
gem 'jquery-rails'
gem 'turbolinks'
gem 'uglifier', '>= 2.7.1'

group :development, :test do
  gem 'byebug'
  gem 'sqlite3', '1.3.11'
  gem 'rspec-rails', '3.7.2'
  gem 'capybara', '2.4.4'
  gem 'ZenTest', '4.11.2'
  gem 'database_cleaner', '1.4.1'
  gem 'rspec-autotest', '1.0.0'
  gem 'launchy'

  # gem 'cucumber-rails', :require => false
  # gem 'cucumber-rails-training-wheels'
  # gem 'rspec', '>= 3.3.0'
  # gem 'rack-test', '0.6.3'
  # gem 'rack_session_access', '0.1.1'
  # gem 'launchy', '2.4.3'
  # gem 'rerun', '0.10.0'
  # gem 'webmock', '3.3.0'
end


group :test do
  gem 'cucumber-rails', :require => false
  gem 'cucumber-rails-training-wheels'
  gem 'simplecov', :require => false
end


group :production do
  gem 'pg', '~> 0.21' # for Heroku deployment
  gem 'rails_12factor'
end
