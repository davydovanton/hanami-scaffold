# Hanami::Scaffold
Why?
Because I want to generate crud actions in one command.

## Installation
Add this line to your application's Gemfile:

```ruby
gem 'hanami-scaffold', group: :development
```

And then execute:

    $ bundle binstubs hanami

And add `require "hanami-scaffold"` in bin/hanami before `load Gem.bin_path("hanami", "hanami")`:

```ruby
...
require "hanami-scaffold"
load Gem.bin_path("hanami", "hanami")
```

## Usage
Just call:
```
$ bin/hanami generate scaffold [app] [controller]
```

It's a equivalent of this commands:
```
$ bin/hanami generate action [app] [controller]#index
$ bin/hanami generate action [app] [controller]#new
$ bin/hanami generate action [app] [controller]#create
$ bin/hanami generate action [app] [controller]#show
$ bin/hanami generate action [app] [controller]#edit
$ bin/hanami generate action [app] [controller]#update
$ bin/hanami generate action [app] [controller]#delete
```

### Supported commands
#### `--except`
Just call:
```
$ bin/hanami generate scaffold [app] [controller] --except=delete update edit
```

It's a equivalent of this commands:
```
$ bin/hanami generate action [app] [controller]#index
$ bin/hanami generate action [app] [controller]#new
$ bin/hanami generate action [app] [controller]#create
```

#### `--only`
Just call:
```
$ bin/hanami generate scaffold [app] [controller] --only=index show
```

It's a equivalent of this commands:
```
$ bin/hanami generate action [app] [controller]#index
$ bin/hanami generate action [app] [controller]#show
```

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/davydovanton/hanami-scaffold. This project is intended to be a safe, welcoming space for collaboration, and contributors are expected to adhere to the [Contributor Covenant](http://contributor-covenant.org) code of conduct.


## License

The gem is available as open source under the terms of the [MIT License](http://opensource.org/licenses/MIT).
