source 'http://rubygems.org'

gem 'rails', '3.0.5'

# Thin if webrick fucks up
gem 'thin'

# Bundle edge Rails instead:
# gem 'rails', :git => 'git://github.com/rails/rails.git'

gem 'haml', '>= 3.0.0'

# This needs to be fixed as soon as working rails3 gem is released
gem "ruby-openid"
gem 'rack'
gem 'jquery-rails'
gem 'state_machine'

# Authentication Gems
gem 'devise', :git => 'git://github.com/plataformatec/devise.git'
gem 'omniauth', :git => 'git://github.com/intridea/omniauth.git'


group :test, :development do
  gem 'sqlite3-ruby', :require => 'sqlite3'
  gem "rspec-rails", ">= 2.0.1" # Controller / Model tests
  gem "autotest" # Automatic testing
  gem "faker"
  gem "machinist" # Mocks
  gem "rcov" # Code coverage tool
  gem 'rails-erd' #
  gem 'cucumber-rails' # Acceptance/integration tests
  gem 'selenium-client' # Javascript driver for cucumber / capybara
  gem 'capybara' # Engine for testing with cucumber
  gem 'database_cleaner'
end

# The production environment requires PostgreSQL
group :production do 
  gem "pg"	# PostgreSQL gem
end
