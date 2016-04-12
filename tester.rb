require 'rest-client'
require 'pry'
require 'JSON'

def import_data

 apikey = "0fa7004e9139a09e1423bd884a8947c9:18:62278142" # This isn't going to change.
 query = "'big'" # This is the general search parameter. Put single quotes around it to make it exact.

 request = {params: {query: query, "api-key" => apikey}}

 # return_value = RestClient.get("http://api.nytimes.com/svc/movies/v2/reviews/search.json?query=big&api-key=0fa7004e9139a09e1423bd884a8947c9:18:62278142")
 # return_value = RestClient.get("http://api.nytimes.com/svc/movies/v2/reviews/search.json?query=big&thousand-best=Y&opening-date=1930-01-01;2000-01-01&api-key=")
 return_string = RestClient.get("http://api.nytimes.com/svc/movies/v2/reviews/search.json", request)
 parsed_hash = JSON.parse(return_string)
 binding.pry
 
end  

import_data
