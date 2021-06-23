# Examples

## Send a sms with 'Service' as sender

```ruby
require 'cellsynt'

instance = Cellsynt.new

instance.config[:originator] = 'Service'
instance.config[:originatortype] = 'alpha'
instance.config[:destination] = '0711223344'
instance.config[:text] = 'test'

puts instance.send # OK: 123ABC
```

## Send a sms with another charset

```ruby
require 'cellsynt'

instance = Cellsynt.new('username', 'password')

instance.config[:originator] = '0711223344'
instance.config[:destination] = '0711223344'
instance.config[:charset] = 'ISO-8859-1'
instance.config[:text] = 'I\'m using charset ISO-8859-1!'

puts instance.send # OK: 111AAA, 222BBB, 333CCC
```
