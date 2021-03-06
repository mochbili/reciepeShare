source 'https://rubygems.org'
ruby '2.3.1'

# Bundle edge Rails instead: gem 'rails', github: 'rails/rails'
gem 'rails', '4.2.6'
# Use SCSS for stylesheets
gem 'sass-rails', '~> 5.0'
gem 'bootstrap-sass', '~> 3.3', '>= 3.3.7'
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
gem 'bcrypt', '~> 3.1.7'

# Use Unicorn as the app server
# gem 'unicorn'

# Use Capistrano for deployment
# gem 'capistrano-rails', group: :development

# Upload files in your Ruby applications, map them to a range of ORMs, store them on different backends.
gem 'carrierwave', '~> 0.11.2'

# Manipulate images with minimal use of memory via ImageMagick / GraphicsMagick
gem 'mini_magick', '~> 4.5', '>= 4.5.1'

# will_paginate provides a simple API for performing paginated queries with Active Record
gem 'will_paginate', '~> 3.1', '>= 3.1.5'

# Hooks into will_paginate to format the html to match Twitter Bootstrap styling
gem 'bootstrap-will_paginate', '~> 0.0.10'

# counter_culture provides turbo-charged counter caches that are kept up-to-date
gem 'counter_culture', '~> 0.2.3'

group :development, :test do
  # Call 'byebug' anywhere in the code to stop execution and get a debugger console
  gem 'byebug'

  # Use mysql as the database for Active Record
  gem 'mysql2', '>= 0.3.13', '< 0.5'

  # alternative runtime developer console like IRB
  gem 'pry', '~> 0.10.4'
end

group :development do
  # Access an IRB console on exception pages or by using <%= console %> in views
  gem 'web-console', '~> 2.0'

  # Spring speeds up development by keeping your application running in the background. Read more: https://github.com/rails/spring
  gem 'spring'
end

group :production do
  # Pg is the Ruby interface to the {PostgreSQL RDBMS}[http://www.postgresql.org/].
  gem 'pg', '~> 0.19.0'

  # Run Rails the 12factor way
  gem 'rails_12factor', '~> 0.0.3'
end
