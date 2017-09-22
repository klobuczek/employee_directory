source 'https://rubygems.org'

git_source(:github) do |repo_name|
  repo_name = "#{repo_name}/#{repo_name}" unless repo_name.include?("/")
  "https://github.com/#{repo_name}.git"
end

# Bundle edge Rails instead: gem 'rails', github: 'rails/rails'
gem 'rails'
gem 'pg'
gem 'puma'
gem 'jsonapi_suite'
gem 'jsonapi-rails', git: 'https://github.com/jsonapi-rb/jsonapi-rails.git', ref: '481b5a3fb1968e5e9512b157f7cccafc447fa4eb' # version incompatibility with latest gems
gem 'jsonapi_spec_helpers', require: false
gem 'jsonapi_swagger_helpers', require: false
gem 'kaminari'

group :development, :test do
  gem 'pry'
  gem 'pry-byebug', platform: :mri
  gem 'rspec-rails'
end

group :development do
  gem 'listen'
  # Spring speeds up development by keeping your application running in the background. Read more: https://github.com/rails/spring
  gem 'spring'
  gem 'spring-watcher-listen'
end

group :test do
  gem 'database_cleaner'
  gem "factory_girl_rails"
  gem 'faker'
end

# Windows does not include zoneinfo files, so bundle the tzinfo-data gem
gem 'tzinfo-data', platforms: [:mingw, :mswin, :x64_mingw, :jruby]
