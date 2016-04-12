class User
  
  attr_accessor :user_input, :movie_search_terms, :past_searches, :review

    def initialize
      @past_searches = []
    end

    def movie_search_terms=(terms)
      @movie_search_terms = terms
      past_searches << terms
    end

end