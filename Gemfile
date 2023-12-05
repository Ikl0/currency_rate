# frozen_string_literal: true

source 'https://rubygems.org'

ruby '3.2.2'

gem 'rails', '~> 7.1.2'

gem 'sprockets-rails'

gem 'pg', '~> 1.1'

gem 'puma', '>= 5.0'

gem 'importmap-rails'

gem 'turbo-rails'

gem 'stimulus-rails'

gem 'sassc-rails'

gem 'jbuilder'

gem 'sidekiq', '~> 7.2'
gem 'sidekiq-cron', '~> 1.11'

gem 'redis', '>= 4.0.1'

gem 'tzinfo-data', platforms: %i[windows jruby]

gem 'bootsnap', require: false

group :development, :test do
  gem 'debug', platforms: %i[mri windows]
  gem 'factory_bot_rails'
  gem 'rails-controller-testing'
  gem 'rspec-rails', '~> 6.1.0'
  gem 'rubocop', require: false
  gem 'shoulda-matchers'
  gem 'simplecov', require: false
  gem 'webmock', require: false
end

group :development do
  gem 'web-console'
end
