source 'http://rubygems.org'

gem 'rails', '3.0.9'

# Authorization semantics
gem 'cancan'
# Roles for authorization
gem 'rollable'

# Thin if webrick fucks up
gem 'thin'

# This needs to be fixed as soon as working rails3 gem is released
gem 'rack'
gem 'jquery-rails'
gem 'state_machine'
gem 'haml', '>= 3.0.0'

# Authentication Gems
gem 'devise'
gem 'omniauth', '>= 0.2.6'

# Settings Gem
gem 'settingslogic'

# Revertable :destroy
gem 'rails3_acts_as_paranoid'

# Markdown
gem 'rdiscount'

group :test, :development do
  gem 'sqlite3-ruby', :require => 'sqlite3' # Development database
  gem 'rspec-rails', '>= 2.0.1' # Controller / Model tests
  gem 'autotest' # Automatic testing
  gem 'faker'
  gem 'machinist' # Mocks
  gem 'rails-erd' #
  gem 'simplecov', :require => false
  gem 'cucumber-rails', '0.5.2' # Acceptance/integration tests
  gem 'selenium-client' # Javascript driver for cucumber / capybara
  gem 'capybara' # Engine for testing with cucumber
  gem 'database_cleaner'
  
  # Guard
  gem 'guard'
  gem 'growl'
  gem 'libnotify'
  gem 'guard-spork'
  gem 'guard-rspec'
  gem 'guard-rails'
  gem 'guard-sass'
  gem 'guard-bundler'
  gem 'spork', '~> 0.9.0.rc'
end

group :mac_development do
  gem 'rb-fsevent'
end

group :linux_development do
  gem 'rb-inotify'
end

group :production do
  gem 'pg'  # PostgreSQL gem
end
