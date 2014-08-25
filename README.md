# Mollusk [![Build Status](https://travis-ci.org/matthull/mollusk.svg?branch=master)](https://travis-ci.org/matthull/mollusk)

Mollusk provides chainable filters for arrays and other collections, ActiveRecord-style.

Sometimes you need to wrap a class around data from an array, yaml file,
or another source like [Money::Currency.table](https://github.com/RubyMoney/money).
With Mollusk you can add filters to these wrapper classes using syntax similar to
ActiveRecord named scopes.

## Installation

Add this line to your application's Gemfile:

    gem 'mollusk'

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install mollusk

## Usage Example
````
class Widget
  extend Mollusk::Filterable

  def self.all
    %w( foo bar bashaz )
  end

  filter :starts_with_b, -> { select { |w| w.chars.first == 'b' } }
  filter :long,          -> { select { |w| w.length > 3 } }
 end

 Widget.starts_with_b #=> ['bar', 'baz']
```
## Contributing

1. Fork it ( http://github.com/matthull/mollusk/fork )
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request
