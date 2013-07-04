# DateDiff

Compute the number of days difference between two dates

## Installation

Add this line to your application's Gemfile:

    gem 'date_diff'

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install date_diff

## Usage

### Help

```bash
$ date-diff --help
date-diff: Determine the number of days difference between two dates
Usage: date-diff '<earlier_date>, <later_date>'

Example:
  date-diff '1 1 2013' '1 2 2013'

Options:
    -?, --help                       Show this message
    -v, --version                    Show version
```

### Examples

```bash
$ date-diff '1 1 2013, 1 3 2013'
1 1 2013, 1 3 2013, 59
```

```bash
$ date-diff '1 1 2012, 1 3 2012'
1 1 2012, 1 3 2012, 60
```

## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request
