## World's Best Beaches - Discover, Learn, Explore

This CLI project scrapes a webpage that features a list of the world's 50 best beaches. Upon execution, the program welcomes the user with a numbered list of the world's best beaches and invites them to learn more about the beaches. To learn more, the user must enter the number of the beach. As long as the user enters a number between 1 and 50, the program will return three things to them: 1. Instagram appeal of the beach, 2. Fun fact about the beach, and 3. Travel trips for the beach. If the user wants to see the list of beaches again they must enter "list". If the user wants to end their session with the program, they must enter "exit". If the user enters anything other than one of the three valid command types, they will see a corrective prompt.

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'worlds-best-beaches-cli-project-122018'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install worlds-best-beaches-cli-project-122018

## Usage

TODO: Write usage instructions here

## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `rake spec` to run the tests. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and tags, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/adudley78/worlds-best-beaches-cli-project-122018.

## Authors

Adam Dudley

## License

The gem is available as open source under the terms of the [MIT License](https://github.com/adudley78/worlds-best-beaches-cli-project-122018/blob/master/LICENSE.txt).

## Acknowledgments

Hat tip to:

- Laura Begley Bloom, Senior Contributor at Forbes, author of the online article I scraped for this project, "The World's 50 Best Beaches, Ranked, Plus 6 Getaways Millennials Will Love".
- Corinna Brock (cjbrock) for providing the inspiration for the theme of this project via her Worlds Best Restaurants CLI Gem (https://github.com/cjbrock/worlds-best-restaurants-cli-gem)
