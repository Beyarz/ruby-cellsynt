require_relative 'lib/cellsynt.rb'

instance = Cellsynt.new('username', 'password')

instance.config[:originator] = '0711223344'
instance.config[:destination] = '0711223344'
instance.config[:text] = 'A' * 160

puts instance.send
