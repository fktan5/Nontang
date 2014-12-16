require 'sinatra'
require 'json'

get '/' do
  'IT WORKS!'
end

get '/member' do
  member = { name: "Name" }

  member.to_json
end

get '/story' do
  story = { body: "Body" }
  story.to_json
end

get '/demo' do
  nozomi = Pebbles::LoveLive.nozomi
  nozomi.name
end
