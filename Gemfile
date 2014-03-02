source 'https://rubygems.org'
ruby '2.0.0'
gem 'rails', '3.2.16'
gem 'jquery-rails'
gem 'jquery-ui-rails'
gem 'foundation-rails', '5.0.3.1'
gem 'pg'
gem 'simple_form'
gem 'slim-rails'

group :assets do
  gem 'sass-rails',   '~> 3.2.3'
  gem 'coffee-rails', '~> 3.2.1'
  gem 'uglifier', '>= 1.0.3'
end

group :development do
  gem "better_errors"
  gem "binding_of_caller"
  gem "pry-rails"
  gem 'meta_request'
  gem 'xray-rails'
  gem 'rack-livereload' #config/environments/development - config.middleware.use Rack::LiveReload
  gem 'guard' #bundle exec guard init
  gem 'guard-livereload'
  gem 'guard-pow', require: false #guard init pow -if pow is missing in guardfile
  gem "letter_opener"
end
