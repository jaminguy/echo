require 'rubygems'
require 'sinatra'
require 'json'

get '/' do
  output = "<table border-spacing='0' border-width='1' border-style='solid'>"
  request.env.select {|k,v| k.match("^HTTP.*")}.each do |header|
    output += "<tr><td align='right'>#{header[0].split('_',2)[1]}:</td><td>#{header[1]}</td></tr>"
  end
  output += "</table>"
end

get '/headers' do
  output = "<table border-spacing='0' border-width='1' border-style='solid'>"
  request.env.select {|k,v| k.match("^HTTP.*")}.each do |header|
    output += "<tr><td align='right'>#{header[0].split('_',2)[1]}:</td><td>#{header[1]}</td></tr>"
  end
  output += "</table>"
end

get '/headers.json' do
  request.env.select {|k,v| k.match("^HTTP.*")}.to_json
end

get '/user_agent' do
  request.user_agent
end

get '/ip' do
  request.ip
end