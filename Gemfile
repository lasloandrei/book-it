source 'https://rubygems.org'

# Bundle edge Rails instead: gem 'rails', github: 'rails/rails'
gem 'rails', '4.2.2'
# Use sqlite3 as the database for Active Record
# gem 'sqlite3'
# Changed from sqlite3 to mysql2 using gem:yaml_db to dump and load the database for being able to use CHARTIKICK
gem 'mysql2'
# Use SCSS for stylesheets
gem 'sass-rails', '~> 5.0'
# Use Uglifier as compressor for JavaScript assets
gem 'uglifier', '>= 1.3.0'
# Use CoffeeScript for .coffee assets and views
gem 'coffee-rails', '~> 4.1.0'
# See https://github.com/rails/execjs#readme for more supported runtimes
gem 'therubyracer', platforms: :ruby

gem 'hirb' # pretty formatting in rails console

# Use jquery as the JavaScript library
gem 'jquery-rails'
# Turbolinks makes following links in your web application faster. Read more: https://github.com/rails/turbolinks
gem 'turbolinks'
# Build JSON APIs with ease. Read more: https://github.com/rails/jbuilder
gem 'jbuilder', '~> 2.0'
# bundle exec rake doc:rails generates the API under doc/api.
gem 'sdoc', '~> 0.4.0', group: :doc

# Used for authentication
gem 'devise'

# Admin interface
gem 'activeadmin', github: 'activeadmin/activeadmin'

# Use ActiveModel has_secure_password
gem 'bcrypt', '~> 3.1.7'

# Use Unicorn as the app server
# gem 'unicorn'

# Use Capistrano for deployment
# gem 'capistrano-rails', group: :development

# Use yaml_db gem to dump db to db/data.yml and use it to load it to other db (exp: from sqlit3 to mysql)
gem 'yaml_db'

group :development, :test do
  # used for renaming the app
  gem 'rename'

  gem "rails-erd"

  # Call 'byebug' anywhere in the code to stop execution and get a debugger console
  gem 'byebug'

  gem 'factory_girl_rails'
  gem 'rspec-rails', '~> 3.0'
  gem 'guard-rspec', require: false

  # Access an IRB console on exception pages or by using <%= console %> in views
  gem 'web-console', '~> 2.0'

  # Spring speeds up development by keeping your application running in the background. Read more: https://github.com/rails/spring
  gem 'spring'
end
  #apipie
  gem 'apipie-rails'
  #date-time picker
  gem 'momentjs-rails', '>= 2.9.0'
  gem 'bootstrap3-datetimepicker-rails', '~> 4.14.30'
  #Creates charts for dashboard. Read more: https://github.com/ankane/chartkick
  gem 'chartkick'
  #Chartkick update: allows you to 'group by'
  gem 'groupdate'
  #Highcharts
  gem 'highcharts-rails', '~> 4.1.8' 
  #newer version of cancan, manage access for users 
  gem 'cancancan', '~> 1.10'