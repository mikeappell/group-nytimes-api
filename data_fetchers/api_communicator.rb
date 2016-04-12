require 'rest-client'
require 'pry'
require 'JSON'

class APICommunicator

attr_accessor :search_params
  
  def initialize(search_terms)
    @search_params = search_terms
  end

  def get_JSON_file
    return_value = RestClient.get("http://api.nytimes.com/svc/movies/v2/reviews/search.json?query=big&thousand-best=Y&opening-date=1930-01-01;2000-01-01&api-key=0fa7004e9139a09e1423bd884a8947c9:18:62278142")
  end

  def parse_JSON

  end
  
end

big = APICommunicator.new("beef") 