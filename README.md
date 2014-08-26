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

## Usage
To enable Mollusk filters on a class:

  - `extend Mollusk::Filterable`
  - Use `set_collection_method` to specify a the class method which returns the collection (defaults to `all` if not specified)

Each filter must specify a operation (or operations) that can be applied to the
collection returned by the collection method (for an Array `select`, `reject`, and `include` are good examples.)

## Example
```
class Widget
  extend Mollusk::Filterable
  set_collection_method :parts

  def self.parts
    %w( foo bar bashaz )
  end

  filter :starts_with_b, -> { select { |w| w.chars.first == 'b' } }
  filter :long,          -> { select { |w| w.length > 3 } }
 end

 Widget.starts_with_b.long #=> ['bashaz']
```
## Alternatives
[active_hash](https://github.com/zilkey/active_hash) provides a nice
subset of ActiveRecord functionality for a collection of hashes.

## Contributing

1. Fork it ( http://github.com/matthull/mollusk/fork )
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request
