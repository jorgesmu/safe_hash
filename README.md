# Sihash

Multikey accesing and safety operations on a hash

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'safe_hash'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install safe_hash

## Usage

Multikey accesor

```ruby
001 > require 'sihash'
 => true 
002 > hash = Sihash::Hash.new({ a: { b: { d: [1,2,3] } } })
 => #<Sihash::Hash:0x007fb96a9b5048 @state={:a=>{:b=>{:d=>[1, 2, 3]}}}> 
003 > hash[:a]
 => {:b=>{:d=>[1, 2, 3]}} 
004 > hash[:a, :b]
 => {:d=>[1, 2, 3]} 
005 > hash[:a, :b, :d]
 => [1, 2, 3] 
006 > hash[:a, :b, :r, :e, :f, :g]
 => nil 
```
Safe collection actions(each, map, select, find) without need to check key existance

```ruby
001 >   require 'sihash'
 => false 
002 > hash = Sihash::Hash.new({ a: { b: { d: [1,2,3] } } })
 => #<Sihash::Hash:0x007fb96a95d7a8 @state={:a=>{:b=>{:d=>[1, 2, 3]}}}> 
003 > proc = Proc.new{|e| e*2 }
 => #<Proc:0x007fb96a94f338@(irb):21> 
004 > hash.map([:a, :b, :d], &proc)
 => [2, 4, 6] 
005 > hash.map([:a, :b, :e, :f], &proc)
 => []
```


## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `rake test` to run the tests. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and tags, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/jorgesmu/safe_hash.
