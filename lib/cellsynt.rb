# frozen_string_literal: true
require 'net/http'

# Object for interacting with the api
class Cellsynt
  SMS_CHAR_LIMIT = 160
  SMS_CONCAT_CHAR_LIMIT = 153
  SMS_CONCAT_HARD_LIMIT = 153 * 6

  attr_accessor :endpoint, :config

  def initialize(username = nil, password = nil)
    @endpoint = 'https://se-1.cellsynt.net/sms.php'

    @auth = {
      username: username || ENV['cellsyntUser'],
      password: password || ENV['cellsyntPass']
    }

    @config = {
      destination: nil,
      allowconcat: nil, # Values: 1 - 6
      originator: nil,  # Values: numeric, shortcode & alpha
      expiry: nil,      # Value: Unix timestamp
      text: nil,        # Type: String
      udh: nil,         # Type: Hex

      originatortype: 'numeric', # Values: numeric, shortcode & alpha
      charset: 'UTF-8',          # Values: ISO-8859-1 & UTF-8, Standard: ISO-8859-1
      type: 'text',              # Values: text, binary & unicode, Standard: text
      flash: false,              # Values: true, false
      class: 1,                  # Values: 0 - 3, Standard: 1
      pid: 00                    # Type: Hex, Standard: 00
    }.compact
  end

  def adjust_concat(message)
    return nil if message.chars.length > SMS_CONCAT_HARD_LIMIT

    if message.chars.length > SMS_CHAR_LIMIT
      message_size = message.chars.length

      (1..6).each do |index|
        if (index * SMS_CONCAT_CHAR_LIMIT) >= message_size
          return index
        end
      end
    end
  end

  def format_destination(number)
    number.delete_prefix('0')
    number.dup.prepend('0046')
  end

  def format_originator(number)
    number.delete_prefix('0')
    number.dup.prepend('46')
  end

  def send
    uri = URI(@endpoint)
    req = Net::HTTP::Post.new(uri)

    config[:allowconcat] = adjust_concat(@config[:text])
    config[:destination] = format_destination(@config[:destination])
    config[:originator] = format_originator(@config[:originator])

    form_data = @auth.merge(@config)
    req.set_form_data(form_data)

    res = Net::HTTP.start(uri.hostname, uri.port, use_ssl: true, timeout: 300) do |packet|
      packet.request(req)
    end

    res.body
  end
end
