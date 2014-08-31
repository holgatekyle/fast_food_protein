source 'https://rubygems.org'

# Bundle edge Rails instead: gem 'rails', github: 'rails/rails'
gem 'rails', '4.0.4'
gem 'bcrypt-ruby', '3.1.2'

# Use SCSS for stylesheets
gem 'sass-rails', '~> 4.0.2'
gem 'bootstrap-sass', '~> 3.2.0'
gem 'sprockets', '2.11.0'
gem 'will_paginate'
gem 'bootstrap-will_paginate'

# Use Uglifier as compressor for JavaScript assets
gem 'uglifier', '>= 1.3.0'
gem 'newrelic_rpm'

# Use CoffeeScript for .js.coffee assets and views
gem 'coffee-rails', '~> 4.0.0'

# Use jquery as the JavaScript library
gem 'jquery-rails'

gem 'redcarpet' # For the Markdown parsing

# Build JSON APIs with ease. Read more: https://github.com/rails/jbuilder
gem 'jbuilder', '~> 1.2'

gem 'has_scope'

group :doc do
  # bundle exec rake doc:rails generates the API under doc/api.
  gem 'sdoc', require: false
end

group :development, :test do
  gem 'pg', '0.15.1'
  gem 'rspec-rails', '2.13.1'
end

group :test do
  gem 'pg', '0.15.1'
  gem 'selenium-webdriver', '2.35.1'
  gem 'capybara', '2.1.0'
  gem 'factory_girl_rails', '4.2.1'
  gem 'cucumber-rails', '1.4.0', :require => false
  gem 'database_cleaner', github: 'bmabey/database_cleaner'

  # Uncomment this line on OS X.
  # gem 'growl', '1.0.3'

  # Uncomment these lines on Linux.
  # gem 'libnotify', '0.8.0'

  # Uncomment these lines on Windows.
   gem 'rb-notifu', '0.0.4'
   #gem 'win32console', '1.3.2'
   gem 'wdm', '0.1.0'
end

group :production do
  gem 'pg', '0.15.1'
  gem 'rails_12factor'
end