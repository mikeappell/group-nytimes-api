class CLI
  attr_accessor :user_response

  def welcome
    puts "Hello, welcome to Justin and Mike's NYT Movie Review CLI!"
  end

  def get_user_input(user)
    if 
    



  def get_movie_choice(user)
    puts "What movie do you want to search for?"
    user_response_response = gets.chomp
    user.search_terms = response
    user.past_searches.push(response)
  end

  def confirm_movie_selection(review_array)
    if review_array.length == 1
      review_array.first.stringify_attributes
      self.scrape_review? 
    else
    puts ""  
    puts "Cool. Here's a list of movies that fit that description."
    puts "Which one of these is the movie you're looking for?"
    puts ""
    puts "Enter the number next to the movie:"
    puts ""
    review_array.each_with_index {|review, index| puts "#{index+1}. #{review.display_title}"}
      end

    end

   def scrape_review?
    puts ""
    puts "I can also get you the full review by using a web scraper called Nokogiri."
    puts ""
    puts "Press Y and enter to get the review, or N and enter to go back to the terminal"
  end





  end