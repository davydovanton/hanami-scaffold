# Hanami::Scaffold
Why?
Because I what to generate crud actions in one command.

## Installation
Add this line to your application's Gemfile:

```ruby
gem 'hanami-scaffold', group: :development
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install hanami-scaffold

## Usage
Just call:
```
$ bundle exec hanami generate scaffold [app] [controller]
```

It's a equivalent of this commands:
```
$ bundle exec hanami generate action [app] [controller]#index
$ bundle exec hanami generate action [app] [controller]#new
$ bundle exec hanami generate action [app] [controller]#create --method=post
$ bundle exec hanami generate action [app] [controller]#show
$ bundle exec hanami generate action [app] [controller]#edit
$ bundle exec hanami generate action [app] [controller]#update --method=put
$ bundle exec hanami generate action [app] [controller]#delete --method=destroy
```

### Supported command
#### `--except`
Just call:
```
$ bundle exec hanami generate scaffold [app] [controller] --except=delete update edit
```

It's a equivalent of this commands:
```
$ bundle exec hanami generate action [app] [controller]#index
$ bundle exec hanami generate action [app] [controller]#new
$ bundle exec hanami generate action [app] [controller]#create --method=post
```

#### `--only`
Just call:
```
$ bundle exec hanami generate scaffold [app] [controller] --only=index show
```

It's a equivalent of this commands:
```
$ bundle exec hanami generate action [app] [controller]#index
$ bundle exec hanami generate action [app] [controller]#show
```

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/davydovanton/hanami-scaffold. This project is intended to be a safe, welcoming space for collaboration, and contributors are expected to adhere to the [Contributor Covenant](http://contributor-covenant.org) code of conduct.


## License

The gem is available as open source under the terms of the [MIT License](http://opensource.org/licenses/MIT).

