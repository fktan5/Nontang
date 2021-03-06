require 'sinatra'
require 'json'
require 'yaml'

get '/' do
  'LoveLiveAPI * usage : member?name=honoka , story?num=1&season=1'
end

get '/aqours' do
  aq = YAML.load_file("aqours.yml")
  if(params[:name] == nil)
    aq["dia"].to_json
  else
    aq[params[:name]].to_json
  end
end

get '/member' do
  member = choice_member(params[:name])
  m = {
    name: member.name,
    cv:   member.cv,
    birth: member.birth,
    birth_zodiac: member.zodiac_sign,
    blood: member.blood_type,
    three_size: member.three_size,
    favorite_food: member.favorite_food,
    dislike_food: member.dislike_food,
    profile: member.profile
  }
  m.to_json
end

get '/story' do
  stories = Pebbles::LoveLive::Story.new.story

  num = params[:num].to_i
  num = 1 if num.nil? || num > 13
  num -= 1

  season = params[:season].to_i
  season = 1 if params[:season].nil?

  case season
  when 1 then
    s = stories[:season1]
  when 2 then
    s = stories[:season2]
  else
    s = stories[:season1]
  end

  story = {
    season: season,
    number: s[num].number ,
    title:  s[num].title, 
    desc:   s[num].description
  }
  
  story.to_json
end

def choice_member(param)
  pbl = Pebbles::LoveLive
  m = pbl.send(param || :nozomi)
end
