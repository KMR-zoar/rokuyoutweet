#!/usr/bin/env ruby
# config: UTF-8

require 'bundler'
Bundler.require

require 'json'

current_path = File.expand_path(File.dirname(__FILE__))
setting_file = current_path + '/setting.json'

consumer_key = "RfMI7kQ6AnosgAOlk2tHpgVwF"
consumer_secret = "c3nNZlTRRbWkUFX9HVot0ibRfiES7Yjj60Na4I9CHGwJPgSLNE"

json_data = {}

consumer = OAuth::Consumer.new(
   consumer_key,
   consumer_secret,
   :site => 'https://api.twitter.com'
)

request_token = consumer.get_request_token
puts "Please allow this app by accessing the URL."
puts request_token.authorize_url

puts "Input your PIN code."
pin = gets.strip
access_token = request_token.get_access_token(:oauth_verifier => pin)

json_data['ck'] = consumer_key
json_data['cs'] = consumer_secret
json_data['at'] = access_token.token
json_data['as'] = access_token.secret

open(setting_file, 'w:UTF-8') do |io|
  JSON.dump(json_data, io)
end
