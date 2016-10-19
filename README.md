# Capistrano::Django

Django specific tasks for Capistrano v3:

  - `cap deploy:migrate`
  - `cap pip:install`

## Installation

Add these lines to your application's Gemfile:

```ruby
group :development do
  gem 'capistrano', '~> 3.6'
  gem 'capistrano-django', '~> 1'
end
```

Run the following command to install the gems:

```
bundle install
```

Then run the generator to create a basic set of configuration files:

```
bundle exec cap install
```

## Usage

```ruby
# Capfile
require 'capistrano/django'
```

Please note that any `require`s should be placed in `Capfile`, not in `config/deploy.rb`.

You can tweak some Django-specific options in `config/deploy.rb`:

```ruby
# If the environment differs from the stage name
set :django_env, 'staging'

# Defaults to :db role
set :migration_role, :db

# Defaults to the primary :db server
set :migration_servers, -> { primary(fetch(:migration_role)) }
```

## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request
