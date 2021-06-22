# frozen_string_literal: true

require 'net/http'
require 'uri'

class Cellsynt
  attr_accessor :username, :password, :endpoint, :payload

  def initialize(username = nil, password = nil)
    @endpoint = 'https://se-1.cellsynt.net/sms.php'

    @username = username || ENV['cellsyntUser']
    @passowrd = password || ENV['cellsyntPass']

    @payload = {
      :destination => nil,
      :text => nil,           # Naturaly there is a limit of 160 chars but with 'allowconcat' you can link your messages to reach over 918 chars.
      :charset => 'UTF-8' ,   # Values: ISO-8859-1 & UTF-8, Standard: ISO-8859-1
      :originatortype => nil, # Values: numeric, shortcode & alpha
      :originator => nil,     # Values: numeric, shortcode & alpha
      :type => 'text',        # Values: text, binary & unicode, Standard: text
      :allowconcat => 1,      # Values: 1 - 6
      :expiry => nil,         # Value: Unix timestamp
      :flash => false,        # Values: true, false
      :class => 1,            # Values: 0 - 3, Standard: 1
      :udh => nil,            # Type: Hex
      :pid => 00              # Type: Hex, Standard: 00
  }.compact
  end

  def send(addition = {})
    uri = URI(@endpoint)
    req = Net::HTTP::Post.new(uri)
    req.set_form_data(@payload.compact, addition)

    res = Net::HTTP.start(uri.hostname, uri.port, :use_ssl => true, :timeout => 300) do |packet|
      packet.request(req)
    end

    res.body
  end
end

instance = Cellsynt.new

instance.username = nil
instance.password = nil

instance.payload[:destination] = nil
instance.payload[:text] = nil
instance.payload[:originator] = nil
instance.payload[:allowconcat] = nil

puts instance.send
