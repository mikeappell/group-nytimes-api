require 'rest-client'
require 'pry'
require 'JSON'

class APICommunicator

  attr_accessor :search_params, :apikey
  
  def initialize(search_terms)
    @apikey = "0fa7004e9139a09e1423bd884a8947c9:18:62278142"
    @search_params = "\'#{search_terms}\'"
  end

  def get_JSON_file
    request = {:params => {:query => search_params, "api-key" => apikey}}
    # return_value = RestClient.get("http://api.nytimes.com/svc/movies/v2/reviews/search.json", request)
    return_value = RestClient.get("http://api.nytimes.com/svc/movies/v2/reviews/search.json?query=big&api-key=0fa7004e9139a09e1423bd884a8947c9:18:62278142")
    binding.pry
  end

  def parse_JSON(api_string)
    parsed_return = JSON.parse(api_string)
  end
  
end

# binding.pry
big = APICommunicator.new("big")
parsed = big.parse_JSON(big.get_JSON_file)
# binding.pry