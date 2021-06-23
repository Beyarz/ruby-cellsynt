# Ruby-cellsynt

Ruby gem for interacting with [Cellsynt.com](https://www.cellsynt.com/)

## Coverage

This gem allows you to interact with every parameter Cellsynt's sms gateway [offers](https://www.cellsynt.com/pdf/Cellsynt_SMS_gateway_HTTP_interface_(English).pdf)

## Examples

### Send a plain sms with 450 characters

The message size is checked at runtime. If you reach over the limit of 160 characters then the content switches into a linkable sms which concatenates the content allowing you to reach up to 918 characters instead. The parameters is automatically adjusted so you don't have to think about that.

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

`gem 'ruby-cellsynt', '~> 1.0'`

## Dev

### Getting started

`bundle install`

### Lint

`rubocop`
