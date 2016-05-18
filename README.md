# DisplayDate

Eases the display of event dates in every following cases:

* one or two date(s)
* display the time or not
* both dates are on the same day or not

## TODO

* Add more control over formatting

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'display_date'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install display_date

## Usage

```ruby
# as_date
DisplayDate.new(d1).as_date             # "on February 03, 2001"
DisplayDate.new(d1, nil).as_date        # "on February 03, 2001"
DisplayDate.new(d1, d1).as_date         # "on February 03, 2001"
DisplayDate.new(d1, d2).as_date         # "from February 03, 2001 to February 04, 2001"

# as_datetime
DisplayDate.new(d1t1).as_datetime       # "on February 03, 2001 at 04:05"
DisplayDate.new(d1t1, nil).as_datetime  # "on February 03, 2001 at 04:05"
DisplayDate.new(d1t1, d1t2).as_datetime # "on February 03, 2001 from 04:05 to 06:07"
DisplayDate.new(d1t1, d2t2).as_datetime # "from February 03, 2001 at 04:05 to February 04, 2001 at 06:07"
```

## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `rake spec` to run the tests. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and tags, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Testing

Run the specs:

    $ rspec spec/

Or start a mutant apocalypse:

    $ bin/run_mutant

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/[USERNAME]/display_date. This project is intended to be a safe, welcoming space for collaboration, and contributors are expected to adhere to the [Contributor Covenant](contributor-covenant.org) code of conduct.

## License

The gem is available as open source under the terms of the [MIT License](http://opensource.org/licenses/MIT).
