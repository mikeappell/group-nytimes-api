require 'rest-client'
require 'pry'
require 'JSON'

class APICommunicator

attr_accessor :search_params, :raw_data, :parsed_data
  
  def initialize(search_terms)
    @search_params = search_terms
  end

  def get_JSON_file
    self.raw_data = RestClient.get("http://api.nytimes.com/svc/movies/v2/reviews/search.json?query=big&thousand-best=Y&opening-date=1930-01-01;2000-01-01&api-key=0fa7004e9139a09e1423bd884a8947c9:18:62278142")
  end

  def parse_JSON
    self.parsed_data = JSON.parse(raw_data)
  end

  def get_data
    self.get_JSON_file
    self.parse_JSON
    results_array = parsed_data["results"].collect do |entry|
      Review.new(entry)
    end
    results_array
  end
  
end
