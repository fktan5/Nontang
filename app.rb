require 'sinatra'
require 'json'

get '/' do
  'LoveLiveAPI'
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

def choice_member(param)
  case param
  when "honoka" then
    Pebbles::LoveLive.honoka
  when "umi" then
    Pebbles::LoveLive.umi
  when "kotori" then
    Pebbles::LoveLive.kotori
  when "maki" then
    Pebbles::LoveLive.maki
  when "hanayo" then
    Pebbles::LoveLive.hanayo
  when "rin" then
    Pebbles::LoveLive.rin
  when "eli" then
    Pebbles::LoveLive.eli
  when "nico" then
    Pebbles::LoveLive.nico
  else
    Pebbles::LoveLive.nozomi
  end
end
