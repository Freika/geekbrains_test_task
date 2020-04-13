# frozen_string_literal: true

source 'https://rubygems.org'
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

ruby '2.6.5'

gem 'bootsnap', '>= 1.4.2', require: false
gem 'pg', '>= 0.18', '< 2.0'
gem 'puma', '~> 4.1'
gem 'rails', '~> 6.0.2', '>= 6.0.2.2'

gem 'sassc-rails'
gem 'slim-rails'
gem 'turbolinks', '~> 5'
gem 'webpacker', '~> 4.0'

gem 'activeadmin'
gem 'bcrypt', '~> 3.1'

group :development, :test do
  gem 'brakeman', '~> 4.8.1', require: false
  gem 'bundler-audit'
  gem 'byebug', platforms: %i[mri mingw x64_mingw]
  gem 'capybara'
  gem 'factory_bot_rails'
  gem 'ffaker'
  gem 'rspec-rails', '~> 4.0.0'
  gem 'rubocop', require: false
  gem 'rubocop-performance', require: false
  gem 'rubocop-rspec', require: false
  gem 'strong_migrations'
end

group :development do
  gem 'annotate'
  gem 'bullet'
  gem 'listen', '>= 3.0.5', '< 3.2'
  gem 'overcommit'
  gem 'web-console', '>= 3.3.0'
end

group :test do
  gem 'shoulda-matchers', '~> 3.1'
  gem 'simplecov'
  gem 'simplecov-lcov'
end

gem 'dry-container'
gem 'dry-monads'
gem 'will_paginate', '~> 3.1.0'
gem 'will_paginate-bootstrap4'
