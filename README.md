# IndustrialGirl

[![Build Status](https://secure.travis-ci.org/danbickford007/industrial_girl.png)](http://travis-ci.org/danbickford007/industrial_girl?branch=master)

Industrial Girl generates factories for Factory Girl using Faker.  You are able to generate your 
factories in a single file or in multiple files.

## Installation

Add this line to your application's Gemfile:

    gem 'industrial_girl'

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install industrial_girl

## Usage

cd to rails root

get usage
  industrial_girl
create multiple factory files within spec/factories directory
  industrial_girl g or industrial_girl generate 
create a single factory file with spec
  industrial_girl g single
if you already have factories, but want industrial_girl to overwrite them and make new factories(you can still pass the single argument if needed)
  industrial_girl g force

within your rails app Gemfile, you may need to set the following if you get the following error(Factory already registered),
gem "factory_girl_rails", :require=>false

## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request
