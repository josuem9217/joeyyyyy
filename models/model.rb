require 'net/http'
require 'json'
require 'pp' 


 
class Output
    attr_reader :output
    def initialize(input)

        split_input = input.split(/[\s,']/) #splits their input into words
        get_syn(split_input)
        
        
    end



    def get_syn(split_input) #gets synonym of input
        split_output=[]
        split_input.each { |word|  #find the synonym of each word at a time
        begin
            url = "http://words.bighugelabs.com/api/2/e599e5fb8e6f9fc0ee92f7299cd1c834/#{word}/json" #grabs json file of a single word
            uri = URI(url)
            response = Net::HTTP.get(uri)
            split_output << JSON.parse(response)["noun"].first.last.sample #adds a random synonym to the output array.
        rescue
            split_output << word #if no synoym exists then the original word will be added to array
        end
        }
        @output=split_output.join(" ") #converts the array into an easily readable string
        
       
    end
     
  
 
end
 

class Trump

     attr_reader :msg
     def initialize
        url = 'https://api.whatdoestrumpthink.com/api/v1/quotes/random'
        uri = URI(url)
        response = Net::HTTP.get(uri)
       @msg = JSON.parse(response)["message"]
     end
end

