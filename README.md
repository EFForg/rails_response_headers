# RailsResponseHeaders

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'rails_response_headers'
```

And then execute:

    $ bundle

## Usage

Create a YAML file at `config/response-headers.yml` with a mapping from your controller actions
to the set of headers which should be set in the response. For example:

```
# config/response-headers.yml

welcome#index:
  Surrogate-Control: public, max-age=120
  Vary: Accept-Encoding, Accept-Language
```

When the `index` action of `WelcomeController` is hit, `Surrogate-Control` and `Vary` headers will
be included in the response.

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/efforg/rails_response_headers.

## License

The gem is available as open source under the terms of the [MIT License](http://opensource.org/licenses/MIT).

