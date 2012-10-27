source 'https://rubygems.org'

gem 'rails', '3.2.8'

# Bundle edge Rails instead:
# gem 'rails', :git => 'git://github.com/rails/rails.git'

gem 'underscore-rails'
# gem 'dailycred', :git => 'https://github.com/hstove/omniauth-dailycred.git'
gem 'dailycred', '0.1.41'
# gem 'dailycred', :path => '../gems/dailycred'


# Gems used only for assets and not required
# in production environments by default.
group :assets do
  gem 'less-rails'
  gem 'sass-rails',   '~> 3.2.3'
  gem 'coffee-rails', '~> 3.2.1'
  # See https://github.com/sstephenson/execjs#readme for more supported runtimes
  # gem 'therubyracer', :platforms => :ruby
  gem 'uglifier', '>= 1.0.3'
end

gem "twitter-bootstrap-rails"

group :development, :test do
  gem 'sqlite3'
  gem 'quiet_assets'
  gem 'mocha_rails'
  gem 'factory_girl_rails'
  gem 'spork-rails'
  gem 'spork-testunit'
  gem "mocha", :require => false
  gem 'guard-spork'
  gem 'guard-test'
  gem 'capybara'
  # gem 'capybara-webkit' use webkit for headless integration tests
  gem 'database_cleaner'
  # use these gems for notifications from guard when running tests
  # gem 'ruby_gntp'
  # gem 'growl'
  # gem 'rb-fsevent', :require => false
end

group :production do
  gem 'pg'
end

gem 'jquery-rails'

# To use ActiveModel has_secure_password
# gem 'bcrypt-ruby', '~> 3.0.0'

# To use Jbuilder templates for JSON
# gem 'jbuilder'

# Use unicorn as the app server
# gem 'unicorn'

# Deploy with Capistrano
# gem 'capistrano'

# To use debugger
# gem 'debugger'
