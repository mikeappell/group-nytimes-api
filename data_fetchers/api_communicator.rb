require 'rest-client'
require 'pry'
require 'JSON'

class APICommunicator

attr_accessor :search_params, :raw_data, :parsed_data, :user_query
  
  def initialize(user_query)
    @user_query = user_query
  end

  def get_query_URI
    movie_base = "http://api.nytimes.com/svc/movies/v2/reviews/search.json?query="
    api_key = "api-key=0fa7004e9139a09e1423bd884a8947c9:18:62278142"
    interpreted_string = user_query.tr(" ", "+")
    self.search_params = movie_base + interpreted_string + "&" + api_key 
  end

  def get_JSON_file
    self.raw_data = RestClient.get(search_params)
  end

  def parse_JSON
    self.parsed_data = JSON.parse(raw_data)
  end

  def get_data
    self.get_query_URI
    self.get_JSON_file
    self.parse_JSON
    results_array = parsed_data["results"].collect do |entry|
      Review.new(entry)
    end
    results_array
  end
  
end
