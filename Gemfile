source 'http://rubygems.org'


# Bundle edge Rails instead: gem 'rails', github: 'rails/rails'
gem 'rails', '4.2.4'
# Use sqlite3 as the database for Active Record
gem 'sqlite3'
# Use SCSS for stylesheets
gem 'sass-rails', '~> 5.0'
# Use Uglifier as compressor for JavaScript assets
gem 'uglifier', '>= 1.3.0'
# Use CoffeeScript for .coffee assets and views
gem 'coffee-rails', '~> 4.1.0'
# See https://github.com/rails/execjs#readme for more supported runtimes
# gem 'therubyracer', platforms: :ruby

# Use jquery as the JavaScript library
gem 'jquery-rails'
# Turbolinks makes following links in your web application faster. Read more: https://github.com/rails/turbolinks
gem 'turbolinks'
# Build JSON APIs with ease. Read more: https://github.com/rails/jbuilder
gem 'jbuilder', '~> 2.0'
# bundle exec rake doc:rails generates the API under doc/api.
gem 'sdoc', '~> 0.4.0', group: :doc

# Use ActiveModel has_secure_password
# gem 'bcrypt', '~> 3.1.7'

# Use Unicorn as the app server
# gem 'unicorn'

# Use Capistrano for deployment
# gem 'capistrano-rails', group: :development

group :development, :test do
  # Call 'byebug' anywhere in the code to stop execution and get a debugger console
  gem 'byebug'
end

group :development do
  # Access an IRB console on exception pages or by using <%= console %> in views
  gem 'web-console', '~> 2.0'

  # Spring speeds up development by keeping your application running in the background. Read more: https://github.com/rails/spring
  #gem 'spring'
end

gem 'slim-rails'

gem 'foundation-rails'

gem 'bower-rails'

gem "protected_attributes"

skip_gems_with_assets = !!ENV['OAF']

if !skip_gems_with_assets
  gem 'rails_admin'
  gem 'rails_admin_nestable'
  gem 'ckeditor'
end

gem 'devise'

gem 'enumerize'



gem 'paperclip'

gem 'acts-as-taggable-on'
#gem 'rails_admin_tag_list'

gem 'pluck_to_hash'

gem 'inline_svg'

gem 'placeholdit'

gem 'ffaker'
gem 'faker'

gem 'quiet_assets'


gem 'kaminari'

gem "htmlcompressor"
gem 'rack-page_caching'
gem 'paperclip-optimizer'

gem 'time_diff'


local = ENV["LOCAL"]

if local
  #gem 'cms', path: "/media/data/pasha/gems/cms"
else
  gem 'cms', github: "pkorenev/cms", branch: :master, ref: "46a5a743ae0350d16b3aa35f74c0893964bff480"
end

gem 'pry-rails'

gem 'bigdecimal'

gem 'therubyracer'

gem 'image_optim'
gem 'image_optim_pack'
gem 'asset-image-opt'

gem 'sprockets-image_compressor'

