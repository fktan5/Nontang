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
    expect(last_response.body).to eq('IT WORKS!')
  end

  it "says story" do
    get '/story'
    last_response.should be_ok
  end

  it "says story with param" do
    get '/story?season=1&num=2'
    last_response.should be_ok
  end

  it "says story with bad param" do
    get '/story?nicopuri=joshido'
    last_response.should be_ok
  end

  it "says member(No param)" do
    get '/member'
    last_response.should be_ok
  end

  it "says member(with param)" do
    get '/member?name=honoka'
    last_response.should be_ok
  end

  it "says member(with bad param)" do
    get '/member?wrong=param'
    last_response.should be_ok
  end
end
