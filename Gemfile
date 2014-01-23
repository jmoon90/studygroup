source 'https://rubygems.org'

# Bundle edge Rails instead: gem 'rails', github: 'rails/rails'
gem 'rails', '4.0.2'

# Use postgresql as the database for Active Record
gem 'pg'

gem 'rails_12factor', group: :production

# Use SCSS for stylesheets
gem 'sass-rails', '~> 4.0.0'

#instead of webrex using unicorn
gem 'unicorn'

#background processors
gem 'sidekiq'
gem 'sinatra', require: false
gem 'slim'
gem 'sidetiq'

gem 'sinatra', require: false

# Use Uglifier as compressor for JavaScript assets
gem 'uglifier', '>= 1.3.0'

# Use CoffeeScript for .js.coffee assets and views
gem 'coffee-rails', '~> 4.0.0'

# See https://github.com/sstephenson/execjs#readme for more supported runtimes
# gem 'therubyracer', platforms: :ruby

# Use jquery as the JavaScript library
gem 'jquery-rails'

# Turbolinks makes following links in your web application faster. Read more: https://github.com/rails/turbolinks
gem 'turbolinks'

# Build JSON APIs with ease. Read more: https://github.com/rails/jbuilder
gem 'jbuilder', '~> 1.2'

gem 'devise'

gem 'foundation-rails'
gem 'compass'

gem 'gravatar_image_tag'

gem 'carrierwave-aws'

gem 'simple_form'

gem 'rmagick'

group :development, :test do
  gem 'dotenv'
  gem 'pry-rails'
  gem 'capybara'
  gem 'rspec-rails'
  gem 'valid_attribute'
  gem 'factory_girl_rails'
  gem 'shoulda-matchers'
  gem 'launchy'
  gem 'email_spec'
end

group :test do
  gem 'coveralls', require: false
end

group :development do
  gem 'quiet_assets'
  gem 'better_errors'
  gem 'binding_of_caller'
  gem 'spring'
  gem "spring-commands-rspec"
end

group :doc do
  # bundle exec rake doc:rails generates the API under doc/api.
  gem 'sdoc', require: false
end

# Use ActiveModel has_secure_password
# gem 'bcrypt-ruby', '~> 3.1.2'

# Use unicorn as the app server
# gem 'unicorn'

# Use Capistrano for deployment
# gem 'capistrano', group: :development

# Use debugger
# gem 'debugger', group: [:development, :test]
