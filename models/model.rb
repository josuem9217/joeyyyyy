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
        split_input = input.split('')
        get_syn(split_input)
        
        
    end
    
    def get_syn(split_input)
        split_output=[]
        split_input.each { |word| 
        begin
            url = "http://words.bighugelabs.com/api/2/e599e5fb8e6f9fc0ee92f7299cd1c834/#{word}/json"
            uri = URI(url)
            response = Net::HTTP.get(uri)
            split_output << JSON.parse(response)["noun"].first.last.last
        rescue
            split_output << word
        end
        }
        @output=split_output.join(" ")
        
        #@output =JSON.parse(response)["noun"].first.last.last
    end
     
  
 
end

# pp Output.new("Hello")
 

 

class Trump

     attr_reader :msg
     def initialize
        url = 'https://api.whatdoestrumpthink.com/api/v1/quotes/random'
        uri = URI(url)
        response = Net::HTTP.get(uri)
       @msg = JSON.parse(response)["message"]
     end
end
