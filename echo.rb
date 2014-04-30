require 'rubygems'
require 'sinatra'
require 'json'

helpers do

    def json_forHeaders()
      json_hash = Hash.new
      request.env.keys.sort.each do |key|
        json_hash[key] = request.env[key]
      end
      json_hash.to_json
    end

    def html()
      json = json_forHeaders()
      erb :index, :locals => {:json => json}
    end
end

get '/' do
  html()
end

get '/json' do
  json_forHeaders()
end

get '/user_agent' do
  request.user_agent
end

get '/ip' do
  request.ip
end
