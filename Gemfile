# frozen_string_literal: true
source 'https://rubygems.org'
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

ruby '3.0.0'

gem 'rails', '~> 7.0.3', '>= 7.0.3.1'

gem 'pg', '~> 1.1'

gem 'puma', '~> 5.0'

# gem "jbuilder"

# gem "redis", "~> 4.0"

# gem "kredis"

# gem "bcrypt", "~> 3.1.7"

gem 'faraday'

gem 'rubocop'
gem 'rubocop-performance'
gem 'rubocop-rails'
gem 'rubocop-require_tools', '~> 0.1.2'
gem 'rubocop-rspec'

gem 'tzinfo-data', platforms: %i[mingw mswin x64_mingw jruby]

gem 'bootsnap', require: false

# gem "image_processing", "~> 1.2"

# gem "rack-cors"

group :development, :test do
  gem 'debug', platforms: %i[mri mingw x64_mingw]
  gem 'factory_bot_rails'
  gem 'rails-controller-testing'
  gem 'rspec-rails', git: 'git@github.com:rspec/rspec-rails.git', branch: '6-0-maintenance'
  gem 'shoulda-matchers', '~> 5.1.0'
end

group :development do
  # gem "spring"
end

