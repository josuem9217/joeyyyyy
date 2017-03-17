require 'dotenv/load'
require 'bundler'
Bundler.require

require_relative 'models/model.rb'

class ApplicationController < Sinatra::Base

  get '/' do
    @trump=Trump.new
    erb :index
    
  end
  
  post '/' do
    erb :result
  end
  
  post '/result' do
    input = params[:string]
    # input = input.truncate(5, separator: ' ')
    @string = Output.new(input)
    erb :result
  end 
    
end
