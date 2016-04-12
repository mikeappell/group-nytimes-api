require 'rest-client'
require 'pry'
require 'JSON'

def import_data

 #return_value = RestClient.get("http://api.nytimes.com/svc/movies/v2/reviews/search.json?" + params + key 
 #params = ""
 #[optional-param1=value1]&[...]&api-key={your-API-key}

 return_value = RestClient.get("http://api.nytimes.com/svc/movies/v2/reviews/search.json?query=big&thousand-best=Y&opening-date=1930-01-01;2000-01-01&api-key=0fa7004e9139a09e1423bd884a8947c9:18:62278142")
 binding.pry
 
end  

import_data
