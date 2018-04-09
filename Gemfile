source 'https://rubygems.org'

git_source(:github) do |repo_name|
  repo_name = "#{repo_name}/#{repo_name}" unless repo_name.include?("/")
  "https://github.com/#{repo_name}.git"
end

gem 'rails', '~> 5.1.5'
gem 'mysql2', '>= 0.3.18', '< 0.5'
gem 'puma', '~> 3.7'

gem 'sass-rails', '~> 5.0'
gem 'uglifier', '>= 1.3.0'
gem 'therubyracer', platforms: :ruby
# gem 'turbolinks', '~> 5'

gem 'jquery-rails'
gem "twitter-bootstrap-rails"
gem "font-awesome-rails"
gem "chosen-awesome-rails"
gem 'bootstrap-wysihtml5-rails'
gem 'alertifyjs-rails'
gem 'awesome_nested_set'

gem 'devise'
gem "pundit"
gem 'simple_form'
gem 'paperclip'
gem "cocoon"
gem 'city-state'
gem 'nationality'

gem 'aws-sdk', '~> 3'

gem 'unicorn'

gem 'wicked_pdf'
gem 'wkhtmltopdf-binary'
gem 'caracal'
gem 'caracal-rails'


group :development, :test do
  # Call 'byebug' anywhere in the code to stop execution and get a debugger console
  gem 'byebug', platforms: [:mri, :mingw, :x64_mingw]
end

group :development do
  gem "capistrano", "~> 3.10", require: false
  gem "capistrano-rails", "~> 1.3", require: false
  gem 'capistrano-rvm'
  gem 'capistrano3-unicorn'

  # Access an IRB console on exception pages or by using <%= console %> anywhere in the code.
  gem 'web-console', '>= 3.3.0'
  gem 'listen', '>= 3.0.5', '< 3.2'
  # Spring speeds up development by keeping your application running in the background. Read more: https://github.com/rails/spring
  gem 'spring'
  gem 'spring-watcher-listen', '~> 2.0.0'
end
