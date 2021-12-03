# TheBoard

The unofficial API client library for board.

https://developers.the-board.jp/

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'the-board'
```

And then execute:

    $ bundle install

Or install it yourself as:

    $ gem install the-board

## Usage

```ruby
# Set API key and API token
# https://developers.the-board.jp/doc/index.html#TOC_827bf054f9c82c4ee14a8c5b6c436c9b
TheBoard.configure do |config|
  config.api_key = "xxx"
  config.api_token = "yyy"
end

# Call GET /v1/clients
# https://developers.the-board.jp/doc/index.html#TOC_feaaea5eaa20c0bb196c769e45dd746a
TheBoard::Client.all

# Call POST /v1/clients
# https://developers.the-board.jp/doc/index.html#TOC_f0b0073db0d3544c194864ed43ab4246
TheBoard::Client.create({
  name: "example",
  name_disp: "ex",
})

# Call PUT /v1/clients/:id
# https://developers.the-board.jp/doc/index.html#TOC_f0b0073db0d3544c194864ed43ab4246
TheBoard::Client.update(1, {
  name: "example",
  name_disp: "ex",
})

# Call DELETE /v1/clients/:id
# https://developers.the-board.jp/doc/index.html#TOC_7bd9d995b2069790f23f471fe82ec1f0
TheBoard::Client.destroy(1)
```

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/bugcloud/the-board. This project is intended to be a safe, welcoming space for collaboration, and contributors are expected to adhere to the [code of conduct](https://github.com/bugcloud/the-board/blob/master/CODE_OF_CONDUCT.md).


## License

The gem is available as open source under the terms of the [MIT License](https://opensource.org/licenses/MIT).

## Code of Conduct

Everyone interacting in the TheBoard project's codebases, issue trackers, chat rooms and mailing lists is expected to follow the [code of conduct](https://github.com/bugcloud/the-board/blob/master/CODE_OF_CONDUCT.md).
