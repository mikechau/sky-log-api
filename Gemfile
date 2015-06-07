source 'https://rubygems.org'

ruby '2.2.2'

# Bundle edge Rails instead: gem 'rails', github: 'rails/rails'
gem 'rails', '4.2.1'
# Use postgresql as the database for Active Record
gem 'pg'
# Use SCSS for stylesheets
gem 'sass-rails', '~> 5.0'
# Use Uglifier as compressor for JavaScript assets
gem 'uglifier', '>= 1.3.0'

# Use jquery as the JavaScript library
gem 'jquery-rails'
# Turbolinks makes following links in your web application faster. Read more: https://github.com/rails/turbolinks
# gem 'turbolinks'
# bundle exec rake doc:rails generates the API under doc/api.
gem 'sdoc', '~> 0.4.0', group: :doc

gem 'oj'
gem 'oj_mimic_json'
gem 'to_json', github: 'ahacking/to_json'

gem 'figaro'

gem 'rack-cors'

group :production do
  gem 'passenger'

  gem 'rails_12factor',
    git: 'git://github.com/heroku/rails_12factor.git'

  gem 'newrelic_rpm'
end

group :test do
  gem 'database_cleaner'
end

group :test, :development do
  gem 'rspec-rails', '>= 3.1.0'
  gem 'factory_girl_rails', '>= 4.3.0'
  gem 'railroady'
  gem 'did_you_mean'
  gem 'jazz_hands',
    github: 'nixme/jazz_hands',
    branch: 'bring-your-own-debugger'

  gem 'pry-byebug'
  gem 'thin'
end

group :development do
  gem 'annotate', '>= 2.6.0'
  gem 'better_errors', '>= 1.1.0'
  gem 'binding_of_caller', '>= 0.7.2'
  gem 'quiet_assets', '>= 1.0.2'

  gem 'spring'
  gem 'spring-commands-rspec'

  # Diagnostics
  gem 'bullet'
  gem 'lol_dba', require: false
  gem 'gem_bench', require: false
end
