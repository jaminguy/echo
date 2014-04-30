require 'rubygems'
require 'sinatra'
require 'json'

helpers do
    def html_for_headers()
      output = "<table border-spacing='0' border-width='1' border-style='solid'>"
      request.env.select {|k,v| k.match("^.*")}.each do |header|
        output += "<tr><td align='right'>#{header[0]}:</td><td>#{header[1]}</td></tr>"
      end
      output += "</table>"
    end
end

get '/' do
  html_for_headers()
end

get '/headers' do
   html_for_headers()
end

get '/headers.json' do
  json = request.env.select {|k,v| k.match("^.*")}.to_json
  "#{json}"
end

get '/user_agent' do
  request.user_agent
end

get '/ip' do
  request.ip
end
