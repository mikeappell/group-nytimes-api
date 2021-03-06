class APICommunicator

  attr_accessor :search_params, :raw_data, :parsed_data, :user_query, :results_offset
  attr_reader :api_key
  
  def initialize(user)
    binding.pry
    @api_key = YAML.load_file("/Users/flatironschool/Development/code/Day7/group-nytimes-api/lib/data_fetchers/application.yml")["API-KEY"]
    @user_query = user.user_input.tr(" ", "+")
    @results_offset = 0
  end

  def get_query_URI
    movie_base = "http://api.nytimes.com/svc/movies/v2/reviews/search.json?query="
    # api_key = "api-key=sample-key"
    self.search_params = "#{movie_base}#{user_query}&offset=#{results_offset}&api-key=#{api_key}"
  end

  def get_JSON_file
    self.raw_data = RestClient.get(search_params)
  end

  def parse_JSON
    self.parsed_data = JSON.parse(raw_data)
  end

  def get_data
    results_array = []

    loop do
      self.get_query_URI
      self.get_JSON_file
      self.parse_JSON
      results_array << parsed_data["results"]
      break if !self.parsed_data["has_more"] || results_offset == 500
      self.results_offset += 20
    end

    results_array.flatten.collect { |entry| Review.new(entry) }
  end
  
end