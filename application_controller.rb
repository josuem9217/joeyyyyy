require 'dotenv/load'
require 'bundler'
Bundler.require

require_relative 'models/model.rb'

class ApplicationController < Sinatra::Base

  get '/' do
    @trump=Trump.new #gets random trump quote
    erb :index
    
  end
  
  post '/' do
    erb :result
  end
  
  post '/result' do
    input = params[:string] #grabs users input
    # input = input.truncate(5, separator: ' ')
    @string = Output.new(input) #sends user input to class that returns smartified link
    erb :result
  end 
    
end
