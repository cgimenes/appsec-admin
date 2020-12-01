source 'https://rubygems.org'
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

ruby '~> 2.7.2'

# Bundle edge Rails instead: gem 'rails', github: 'rails/rails'
gem 'rails'
# Use mysql as the database for Active Record
gem 'mysql2'
# Use Puma as the app server
gem 'puma'
# Use SCSS for stylesheets
gem 'sass-rails'
# Use Uglifier as compressor for JavaScript assets
gem 'uglifier'
# See https://github.com/rails/execjs#readme for more supported runtimes
gem 'mini_racer', platforms: :ruby

# Use CoffeeScript for .coffee assets and views
gem 'coffee-rails'
# Turbolinks makes navigating your web application faster. Read more: https://github.com/turbolinks/turbolinks
gem 'turbolinks'
# Build JSON APIs with ease. Read more: https://github.com/rails/jbuilder
gem 'jbuilder'

# Reduces boot times through caching; required in config/boot.rb
gem 'bootsnap', '>= 1.1.0', require: false

# Devise for authentication
gem 'devise'
gem 'devise_ldap_authenticatable'

# Cancan for authorization
gem 'cancancan'

# will_paginate for pagination
gem 'will_paginate'

# Ransack for object-based searching
gem 'ransack'

# Twitter Bootstrap
gem 'bootstrap'

# Font Awesome
gem 'font-awesome-rails'

# PaperTrail for model tracking
gem 'paper_trail'

# Enumerize for custom enums
gem 'enumerize'

# Markdown renderer
gem 'redcarpet'

# jQuery
gem 'jquery-rails'

group :development, :test do
  # Call 'byebug' anywhere in the code to stop execution and get a debugger console
  gem 'byebug', platforms: [:mri, :mingw, :x64_mingw]
  # Use sqlite3 as the database for Active Record
  gem 'sqlite3'
end

group :development do
  gem 'listen'
  # Access an interactive console on exception pages or by calling 'console' anywhere in the code.
  gem 'web-console'
  # Spring speeds up development by keeping your application running in the background. Read more: https://github.com/rails/spring
  gem 'spring'
  gem 'spring-watcher-listen'

  # Bullet to notify when to add eager loading
  gem 'bullet'
end

group :test do
  # Adds support for Capybara system testing and selenium driver
  gem 'capybara'
  gem 'selenium-webdriver'
  # Easy installation and use of chromedriver to run system tests with Chrome
  gem 'chromedriver-helper'
end

# Windows does not include zoneinfo files, so bundle the tzinfo-data gem
gem 'tzinfo-data', platforms: [:mingw, :mswin, :x64_mingw, :jruby]
