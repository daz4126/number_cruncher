ENV['RACK_ENV'] = 'test'
require 'minitest/autorun'
require 'rack/test'
require_relative 'number_cruncher.rb'

include Rack::Test::Methods

def app
  Sinatra::Application
end

describe "Number Cruncher" do

  it "should return the factors of 6" do
    assert_equal [1,2,3,6], 6.factors
  end
  
  it "should say that 2 is prime" do
    assert 2.prime?
  end
  
  it "should say that 10 is not prime" do
    refute 10.prime?
  end
  
  it "should return json" do
    get '/6'
    last_response.headers['Content-Type'].must_equal 'application/json;charset=utf-8'
  end 
 
  it "should return the correct info about 6 as json" do
    get '/6'
    six_info = { number: 6, factors: 6.factors, odd: 6.odd?, even: 6.even?, prime: 6.prime? }
    six_info.to_json.must_equal last_response.body
  end

end
