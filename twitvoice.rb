# -*- coding: utf-8 -*-
require 'twitter'
require 'yaml'

config = YAML.load_file('config.yml')
Twitter.configure do |conf|
  conf.consumer_key = config['consumer_key']
  conf.consumer_secret = config['consumer_secret']
  conf.oauth_token = config['oauth_token']
  conf.oauth_token_secret = config['oauth_token_secret']
end

history = []

while(true)
  tweets = Twitter.home_timeline.reverse
  index = tweets.index do |t|
    !history.index{|h| h['id'] == t['id'] }
  end
  if index
    tweets[index..-1].each do |t|
      user = t['user']
      text = t['text']
      sanitized_text = text.sub(/http[a-zA-Z0-9.\/&#+\-$%@=\[\],?!~:;…]+/, '').sub(/…/, '...')
      puts "#{user['name']} #{user['screenname']} #{text}"
      `say "#{user['name']}, #{sanitized_text}"`
      history << t
    end
  end
  sleep 60
end
