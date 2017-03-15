require 'dotenv/load'
require 'bundler'
Bundler.require

require_relative 'models/model.rb'

class ApplicationController < Sinatra::Base

  get '/' do
    erb :index
  end
  
  post '/' do
    erb :result
  end
  
  post '/result' do
    @string = params[:string]
    # @output = Output.new("#{@string}")
    erb :result
  end 
    
end
