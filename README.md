# Ruby-cellsynt

Ruby gem for interacting with Cellsynt.com

## Coverage

This gem allows you to interact with every parameter Cellsynt's sms gateway [offers](https://www.cellsynt.com/pdf/Cellsynt_SMS_gateway_HTTP_interface_(English).pdf)

## Examples

### Send a plain sms with 450 characters

```ruby
require 'cellsynt'

instance = Cellsynt.new('username', 'password')

instance.config[:originator] = '0711223344'
instance.config[:destination] = '0711223344'
instance.config[:text] = 'A' * 450

puts instance.send # OK: 111AAA, 222BBB, 333CCC
```

### Send a flash sms using credentials from your environment

```ruby
require 'cellsynt'

# Your environment should have these variables set
# cellsyntUser='username'
# cellsyntPass='password'

instance = Cellsynt.new

instance.config[:originator] = '0711223344'
instance.config[:destination] = '0711223344'
instance.config[:text] = 'test'
instance.config[:flash] = true

puts instance.send # OK: 123ABC
```

For more examples see [EXAMPLES.md](EXAMPLES.md)

## Installation

### Gem

`gem install ruby-cellsynt`

### Bundle

`bundle add ruby-cellsynt`

### Gemfile

`gem 'ruby-skynet', '~> 1.3'`

## Dev

### Getting started

`bundle install`

### Lint

`rubocop`
