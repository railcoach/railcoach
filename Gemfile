source 'http://rubygems.org'

gem 'rails', '3.0.9'

# Authorization semantics
gem 'cancan'
# Roles for authorization
gem 'rollable'

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

# Revertable :destroy
gem 'rails3_acts_as_paranoid'

group :test, :development do
  gem 'sqlite3-ruby', :require => 'sqlite3' # Development database
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
  
  # Guard
  gem 'guard'
  gem 'growl'
  gem 'rb-fsevent'
  gem 'libnotify'
  gem 'guard-spork'
  gem 'guard-rspec'
  gem 'guard-rails'
  gem 'guard-sass'
  gem 'spork', '~> 0.9.0.rc'
end

group :production do
  #gem "pg"  # PostgreSQL gem
end
