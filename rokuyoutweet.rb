#!/usr/bin/env ruby
# config: UTF-8

require 'bundler'
Bundler.require

require 'json'
require 'open-uri'
require 'date'

#メタ情報のセット
current_path = File.expand_path(File.dirname(__FILE__))
setting_file = current_path + '/setting.json'

#六曜を取得する API エンドポイント
api_uri = "http://api.sekido.info/qreki?output=jsonp&callback=null"

funky = "ファンキ～～～～～～～～～～～～"

message = ""

unless File.exist?(setting_file)
  mkconfig = current_path + '/make-config.rb'
  system mkconfig
end

tokenObj = open(setting_file) do |json_data|
  JSON.load(json_data)
end

def get_rokuyou(uri)
   rokuyou_json = open(uri).read
   return JSON.load(rokuyou_json[/\((.*?)\)/, 1])
end

client = Twitter::REST::Client.new do |config|
  config.consumer_key = tokenObj['ck']
  config.consumer_secret = tokenObj['cs']
  config.access_token = tokenObj['at']
  config.access_token_secret = tokenObj['as']
end

if Date.today.wday == 5 then
  message = funky
else
  message = get_rokuyou(api_uri)["rokuyou_text"]
end

client.update(message)

exit 0
