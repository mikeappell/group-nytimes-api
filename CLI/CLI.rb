class CLI

  
  def welcome
    puts "Hello, welcome to Justin and Mike's NYT Movie Review CLI!"
  end

  def get_user_input(user)
    puts "What movie do you want to search for?"
    response = gets.chomp
    user.search_terms = response
    user.past_searches.push(response)
  end

end