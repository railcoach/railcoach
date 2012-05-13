source 'http://rubygems.org'

gem 'rails', '3.0.11'

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
gem 'haml', '~> 3.0.0'

# Heroku gem for staging
gem 'heroku'

# Authentication Gems
gem 'devise'
gem 'omniauth', '~> 1.0.0'
gem 'omniauth-facebook'
gem 'omniauth-openid'
gem 'omniauth-github'

# Settings Gem
gem 'settingslogic'

# Revertable :destroy
gem 'rails3_acts_as_paranoid'

# Markdown
gem 'rdiscount'

group :test, :development do
  gem 'sqlite3-ruby', :require => 'sqlite3' # Development database
  gem 'rspec-rails'  # Controller / Model tests
  gem 'autotest' # Automatic testing
  gem 'faker'
  gem 'machinist' # Mocks
  gem 'rails-erd' #
  gem 'simplecov', :require => false
  gem 'database_cleaner'
  
  # Guard
  gem 'guard'
  gem 'libnotify' if /linux/ =~ RUBY_PLATFORM
  gem 'growl' if /darwin/ =~ RUBY_PLATFORM
  gem 'guard-spork'
  gem 'guard-rspec'
  gem 'guard-rails'
  gem 'guard-sass'
  gem 'guard-bundler'
  gem 'spork', '~> 0.9.0.rc'

  # OSX notify
  gem 'rb-fsevent', :require => false

  # Linux notify
  gem 'rb-inotify', :require => false
end

group :production do
  gem 'pg'  # PostgreSQL gem
  gem 'unicorn' # Rails applications server
end
