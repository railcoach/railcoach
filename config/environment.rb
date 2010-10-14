# Load the rails application
require File.expand_path('../application', __FILE__)

# Initialize the rails application
Dynamic::Application.initialize!

Sass::Plugin.options[:style] = :compact
Sass::Plugin.options[:syntax] = :scss
Sass::Plugin.options[:always_update] = true
Sass::Plugin.options[:always_check] = true
