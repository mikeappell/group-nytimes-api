class CLI

  attr_accessor :current_user, :current_api_communicator, :nytimes_scraper
  include Textable
  
  def welcome
    puts "Hello, welcome to Justin and Mike's NYT Movie Review CLI!"
    self.current_user = User.new
    self.help
    self.get_user_input
  end

  def get_user_input
    self.minimal_prompt
    current_user.user_input = gets.chomp.downcase
    if current_user.user_input == "help"
      self.help
      self.get_user_input
    elsif current_user.user_input == "search" || current_user.user_input == "search exact"
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
    puts "If you want assistance, please type 'help' into the terminal."
    puts "If you want to search for movie reviews:\n\t\tPlease type into the terminal 'search' to search for names like that title,\n\t\tOr 'search exact' for that exact title."
    puts "If you would like to exit the CLI, please type 'exit'.\n\n"
  end

  def minimal_prompt
    puts "Please enter a command."
  end

  def get_movie_choice
    puts "What movie do you want to search for?"
    current_user.movie_search_terms = gets.chomp
    if current_user.movie_search_terms == ""
      puts "Sorry, didn't get that. Try again?"
      self.get_movie_choice
    else
      self.current_api_communicator = APICommunicator.new(current_user)
      self.get_reviews_from_api_communicator
    end
  end

  def get_reviews_from_api_communicator
    review_array = current_api_communicator.get_data
    if review_array.empty?
      puts "\nUnfortunately, no movies were found. Please try again.\n\n"
      self.get_user_input
    else
      if current_user.user_input == "search exact"
        self.confirm_movie_selection(review_array)
      else 
        puts "\nCool. Here's a list of movies that fit that description.\n"
        puts "Which one of these is the movie you're looking for?\n"
        display_and_format_movie_array(review_array)
      end
    end
  end

  def confirm_movie_selection(review_array)
    if review_array.length == 1
      display_single_movie(review_array.first)
    else 
      single_review = review_array.detect { |review| review.display_title.downcase == current_user.movie_search_terms.downcase }
      if !single_review.nil?
        display_single_movie(single_review)
      else
        puts "\nWe didn't find an exact match for that movie; here's the closest matches we found:\n\n"
        display_and_format_movie_array(review_array)
      end
    end
  end

  def display_single_movie(review)
    current_user.review = review
    self.nytimes_scraper = NYTimesScraper.new(review)
    review.stringify_attributes(nytimes_scraper)
    self.scrape_review(review)
  end

  def display_and_format_movie_array(review_array)
    review_array.each_with_index do |review, index|
      if index % 2 == 0 then print "%-100.100s" % "#{index+1}. #{review.display_title}"
      else puts "#{index + 1}. #{review.display_title}"
      end
      if (index + 1) % 98 == 0
        puts "\nPlease enter the number next to the movie, or hit enter to show the next 100."
        choice = gets
        if choice.match(/\d+/)
          display_single_movie(review_array[choice.to_i - 1]) 
          break
        end
      elsif index + 1 == review_array.size
        puts "\nPlease enter the number next to the movie."
        choice = gets
        if choice.match(/\d+/)
          display_single_movie(review_array[choice.to_i - 1]) 
          break
        else
          puts "Ok, none of the above? Going back to the index then.\n\n"
          self.get_user_input
        end
      end
    end 
  end

  def scrape_review(review)
    puts "\nI can also get you the full review by using a web scraper called Nokogiri."
    puts "Press Y and enter to get the review, or N and enter to search for another movie"
    user_choice = gets.chomp.downcase
    if user_choice == "y"
      puts "\n#{nytimes_scraper.get_review}\n\n"
      self.get_user_input
    elsif user_choice == "n"
      puts "\nNo problemo.\n"
      self.get_user_input
    else
      puts "Sorry didn't quite get that"
      self.scrape_review(review)
    end
  end

end