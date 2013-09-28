class Integer
  def factors
    square_root = self**0.5
    (1..square_root).map{ |n| [n,self/n] if self/n*n == self }.compact.flatten.sort
  end
  
  def prime?
    self.factors.size == 2 ? true : false
  end
end

require 'sinatra'
require 'json'

get '/:number' do
  content_type :json
  number = params[:number].to_i
  { number: number, factors: number.factors, odd: number.odd?, even: number.even?, prime: number.prime? }.to_json
end
