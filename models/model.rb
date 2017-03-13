require 'net/http'
require 'json'
require 'pp' 
url = 'http://words.bighugelabs.com/api/2/e599e5fb8e6f9fc0ee92f7299cd1c834/word/json'
uri = URI(url)
response = Net::HTTP.get(uri)
 pp JSON.parse(response)
 
 
 