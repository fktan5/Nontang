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
  stories = Pebbles::LoveLive::Story.new.story

  num = params[:num].to_i
  num = 1 if num.nil?

  season = 1 if params[:season].nil?

  case season
  when 1 then
    s = stories[:season1]
  when 2 then
    s = stories[:season2]
  else
    s = stories[:season1]
  end

  puts num.class
  story = {
    number: s[num].number ,
    title:  s[num].title, 
    desc:   s[num].description
  }
  
  story.to_json
end

get '/demo' do
  nozomi = Pebbles::LoveLive.nozomi
  nozomi.name
end
