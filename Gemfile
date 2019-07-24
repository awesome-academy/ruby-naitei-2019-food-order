source "https://rubygems.org"
git_source(:github){|repo| "https://github.com/#{repo}.git"}

gem "bootsnap", ">= 1.1.0", require: false
gem "coffee-rails", "~> 4.2"
gem "config"
gem "faker"
gem "i18n"
gem "jbuilder", "~> 2.5"
gem "mysql2", ">= 0.4.4", "< 0.6.0"
gem "omniauth-google-oauth2"
gem "puma", "~> 3.11"
gem "rack-cors"
gem "rails", "~> 5.2.0"
gem "sass-rails", "~> 5.0"
gem "turbolinks", "~> 5"
gem "uglifier", ">= 1.3.0"

group :development, :test do
  gem "byebug", platforms: [:mri, :mingw, :x64_mingw]
  gem "dotenv-rails"
  gem "rubocop", "~> 0.54.0", require: false
end

group :development do
  gem "listen", ">= 3.0.5", "< 3.2"
  gem "spring"
  gem "spring-watcher-listen", "~> 2.0.0"
  gem "web-console", ">= 3.3.0"
  gem "capistrano", "~> 3.10.1"
  gem "capistrano-rails", "~> 1.3.1" 
  gem "capistrano-rbenv", "~> 2.1"
  gem "capistrano3-puma", "~> 3.1", ">= 3.1.1"
end

group :test do
  gem "capybara", ">= 2.15", "< 4.0"
  gem "chromedriver-helper"
  gem "selenium-webdriver"
end

gem "tzinfo-data", platforms: [:mingw, :mswin, :x64_mingw, :jruby]
