require 'net/http'
require 'json'
require 'pp' 

# url = 'http://words.bighugelabs.com/api/2/e599e5fb8e6f9fc0ee92f7299cd1c834/word/json'
# uri = URI(url)
# response = Net::HTTP.get(uri)
#  pp JSON.parse(response)
 
class Output
    
    def initialize(input)
        split_input = input.split(' ')
        get_syn(split_input)
    end
    
    def get_syn(split_input)
        split_input.each { |word| 
        pp syn(word)["noun"].first.last.last

        }
    end
    
    def syn(word)
        word_st = word.to_s
        url = "http://words.bighugelabs.com/api/2/e599e5fb8e6f9fc0ee92f7299cd1c834/#{word_st}/json"
        uri = URI(url)
        response = Net::HTTP.get(uri)
        JSON.parse(response)
    end

end
 
Output.new("Hello")
 

 