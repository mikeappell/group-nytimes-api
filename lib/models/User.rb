class User
  
  attr_accessor :user_input, :past_searches, :review
  attr_reader :movie_search_terms

    def initialize
      @past_searches = []
    end

    def movie_search_terms=(terms)
      @movie_search_terms = terms
      past_searches << terms
    end

end