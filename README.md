# Ruby-cellsynt

Ruby gem for interacting with Cellsynt.com

## Coverage

This gem allows you to interact with every parameter Cellsynt's sms gateway [offers](https://www.cellsynt.com/pdf/Cellsynt_SMS_gateway_HTTP_interface_(English).pdf)

## Examples

Send a plain sms

```ruby
require 'ruby_cellsynt'

instance = Cellsynt.new('username', 'password')

instance.config[:originator] = '0711223344'
instance.config[:destination] = '0711223344'
instance.config[:text] = 'A' * 160

puts instance.send # OK: 123ABC
```

Send a flash sms using credentials from your environment

```ruby
require 'ruby_cellsynt'

instance = Cellsynt.new

instance.config[:originator] = '0711223344'
instance.config[:destination] = '0711223344'
instance.config[:text] = 'test'
instance.config[:flash] = true

puts instance.send # OK: 123ABC
```

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
