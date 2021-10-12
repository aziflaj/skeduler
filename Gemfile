source 'https://rubygems.org'
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

ruby '2.6.3'

gem 'bootsnap', '>= 1.4.2', require: false
gem 'devise', '~> 4.7'
gem 'jbuilder', '~> 2.7'
gem 'materialize-sass', '~> 1.0.0'
gem 'puma', '~> 4.3'
gem 'rails', '~> 6.0.0'
gem 'sass-rails', '~> 5'
gem 'sqlite3', '~> 1.4'
gem 'turbolinks', '~> 5'
gem 'webpacker', '~> 4.0'

group :development, :test do
  gem 'ffaker', '~> 2.12'
  gem 'pry-rails', '~> 0.3.9'
  gem 'rspec-rails', '~> 3.8'
  gem 'shoulda-matchers', '~> 4.1', '>= 4.1.2'
end

group :development do
  gem 'listen', '>= 3.0.5', '< 3.2'
  gem 'rubocop-rails', '~> 2.3', '>= 2.3.1'
  gem 'spring'
  gem 'spring-watcher-listen', '~> 2.0.0'
  gem 'web-console', '>= 3.3.0'
end

group :test do
  gem 'capybara', '>= 2.15'
  gem 'factory_bot_rails', '~> 5.0', '>= 5.0.2'
  gem 'selenium-webdriver'
  gem 'webdrivers'
end

group :production do
  gem 'redis', '~> 4.0'
end

gem 'tzinfo-data', platforms: %i[mingw mswin x64_mingw jruby]
