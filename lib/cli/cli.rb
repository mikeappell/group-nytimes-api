class CLI
  attr_accessor :current_user, :current_api_communicator
  include Textable

  def welcome
    puts "Hello, welcome to Justin and Mike's NYT Movie Review CLI!"
    self.current_user = User.new
    self.get_user_input
  end

  def get_user_input
    help
    current_user.user_input = gets.chomp.downcase
    if current_user.user_input == "help"
      self.get_user_input
    elsif current_user.user_input == "search"
      self.get_movie_choice
    elsif current_user.user_input == "exit"
      puts "Bye!"
      self.flatiron_heart
    else
      puts "Sorry, didn't quite get that"
      self.get_user_input
    end
  end

  def help
    puts "If you want assistance, please type help into the terminal."
    puts "If you want to search for movie reviews, please type search into the terminal."
    puts "If you would like to exit the CLI, please type exit"
  end

  def get_movie_choice
    puts "What movie do you want to search for?"
    current_user.movie_search_terms = gets.chomp
    self.current_api_communicator = APICommunicator.new(current_user)
    self.get_reviews_from_api_communicator
  end

  def get_reviews_from_api_communicator
    review_array = current_api_communicator.get_data
    self.confirm_movie_selection(review_array)
  end

  def confirm_movie_selection(review_array)
    if review_array.length == 1
      binding.pry
      display_single_movie(review_array.first)
    else 
      single_review = review_array.detect { |review| review.display_title.downcase == current_user.movie_search_terms.downcase }

      unless single_review.nil? then display_single_movie(single_review)
      else display_and_format_movie_array(review_array)
      end
    end
  end

  def display_single_movie(review)
    current_user.review = review
    review.stringify_attributes
    self.scrape_review? 
  end

  def display_and_format_movie_array(review_array) 
    puts "\nCool. Here's a list of movies that fit that description."
    puts "Which one of these is the movie you're looking for?\n"
    review_array.each_with_index do |review, index|
      if index % 2 == 0 then print "%-100.100s" % "#{index+1}. #{review.display_title}"
      else puts "#{index + 1}. #{review.display_title}"
      end
      if (index + 1) % 98 == 0 || index + 1 == review_array.size
        puts "\nEnter the number next to the movie, or hit enter to show the next 100."
        choice = gets
        if choice.match(/\d+/)
          display_single_movie(review_array[choice.to_i - 1]) 
          break
        end
      end
    end 
  end

  def scrape_review?
    puts "\nI can also get you the full review by using a web scraper called Nokogiri."
    puts "Press Y and enter to get the review, or N and enter to search for another movie"
    current_user.user_input = gets.chomp.downcase
    if current_user.user_input == "y"
      puts "Here is where we scrape the web with Nokogiri"
    elsif current_user.user_input == "n"
      self.get_user_input
    else
      puts "Sorry didn't quite get that"
      self.scrape_review?
    end
  end

end