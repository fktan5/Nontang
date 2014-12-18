ENV['RACK_ENV'] = 'test'

require File.join(File.dirname(__FILE__), '..', 'app.rb')
require 'rspec'
require 'rack/test'
require 'pebbles/lovelive'

describe 'The HelloWorld App' do
  include Rack::Test::Methods

  def app
    Sinatra::Application
  end

  it "says itworks" do
    get '/'
    expect(last_response).to be_ok
  end

  it "says story" do
    get '/story'
    expect(last_response).to be_ok
  end

  it "says story with param" do
    get '/story?season=1&num=2'
    expect(last_response).to be_ok
  end

  it "says story with param(season2)" do
    get '/story?season=2&num=2'
    expect(last_response).to be_ok
  end

  it "says story with bad param" do
    get '/story?nicopuri=joshido'
    expect(last_response).to be_ok
  end

  it "says story with bad param" do
    get '/story?season=1&num=20'
    expect(last_response).to be_ok
  end

  it "says member(No param)" do
    get '/member'
    expect(last_response).to be_ok
  end

  it "says member(with param)" do
    get '/member?name=honoka'
    expect(last_response).to be_ok
  end

  it "says member(with bad param)" do
    get '/member?wrong=param'
    expect(last_response).to be_ok
  end
end
