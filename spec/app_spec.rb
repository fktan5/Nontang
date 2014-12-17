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
  end

  it "demo test" do
    get '/demo'
  end
end
