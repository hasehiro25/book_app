# frozen_string_literal: true

source "https://rubygems.org"
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

ruby "2.6.5"

gem "rails", "~> 6.0.1"
gem "sqlite3", "~> 1.4"
gem "puma", "~> 4.3"
gem "sass-rails", ">= 6"
gem "webpacker", "~> 4.0"
gem "turbolinks", "~> 5"
gem "jbuilder", "~> 2.7"
gem "bootsnap", ">= 1.4.2", require: false
gem "carrierwave"
gem "kaminari"
gem "devise"
gem "devise-i18n"
gem "active_decorator"
gem "omniauth"
gem "omniauth-github"
gem "dotenv-rails"
gem "mini_magick"

group :development, :test do
  gem "byebug", platforms: [:mri, :mingw, :x64_mingw]
  gem "awesome_print"
  gem "capistrano", "~> 3.11", require: false
  gem "capistrano-rails", "~> 1.3", require: false
  gem "capistrano-rbenv", require: false
  gem "capistrano-bundler", require: false
  gem "capistrano3-puma"
end

group :development do
  gem "web-console", ">= 3.3.0"
  gem "listen", ">= 3.0.5", "< 3.2"
  gem "spring"
  gem "spring-watcher-listen", "~> 2.0.0"
  gem "rubocop"
  gem "rubocop-performance"
  gem "rubocop-rails"
  gem "letter_opener"
  gem "ed25519"
  gem "bcrypt_pbkdf"
end

group :test do
  gem "capybara", ">= 2.15"
  gem "selenium-webdriver"
  gem "webdrivers"
  gem "database_cleaner"
  gem "simplecov", require: false
  gem "minitest-ci"
  gem 'minitest-retry'
end
