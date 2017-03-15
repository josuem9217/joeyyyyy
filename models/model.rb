require 'net/http'
require 'json'
require 'pp' 

# url = 'http://words.bighugelabs.com/api/2/e599e5fb8e6f9fc0ee92f7299cd1c834/word/json'
# uri = URI(url)
# response = Net::HTTP.get(uri)
#  pp JSON.parse(response)
 
class Output
    attr_reader :output
    def initialize(input)
        split_input = input.split(' ')
        get_syn(split_input)
        
        
    end
    
    def get_syn(split_input)
        split_input.each { |word| 
        url = "http://words.bighugelabs.com/api/2/e599e5fb8e6f9fc0ee92f7299cd1c834/#{word}/json"
        uri = URI(url)
        response = Net::HTTP.get(uri)
        @output =JSON.parse(response)["noun"].first.last.last
        }
        
        
        # @output =JSON.parse(response)["noun"].first.last.last
    end
    
    def syn(word)
        url = "http://words.bighugelabs.com/api/2/e599e5fb8e6f9fc0ee92f7299cd1c834/#{input}/json"
        uri = URI(url)
        response = Net::HTTP.get(uri)
        JSON.parse(response)
    end

end
 
Output.new("Hello")
 

 