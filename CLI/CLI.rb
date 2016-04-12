class CLI
  attr_accessor :user_response

  def welcome
    puts "Hello, welcome to Justin and Mike's NYT Movie Review CLI!"
  end

  def get_user_input(user)
    puts "If you want assistance, please type help into the terminal."
    puts "If you want to search for movie reviews, please type search into the terminal."
    puts "If you would like to exit the CLI, please type exit"
    user.user_input = gets.chomp
    if user.user_input == "help"
      puts "Here is where we help you"
      self.get_user_input(user)
    elsif user.user_input == "search"
      self.get_movie_choice(user)
    elsif user.user_input == "exit"
      puts "Here is where you exit"
    else
      puts "Sorry, didn't quite get that"
      self.get_user_input(user)
    end
  end

  def get_movie_choice(user)
    puts "What movie do you want to search for?"
    user_response = gets.chomp
    user.movie_search_terms = user_response
    user.past_searches.push(user_response)
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