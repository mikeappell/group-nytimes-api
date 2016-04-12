require_relative "../config/environment.rb"

this_session = CLI.new
this_session.welcome
this_user = User.new
this_session.get_user_input(this_user)

new_api = APICommunicator.new(this_user.movie_search_terms)
reviews = new_api.get_data
this_session.confirm_movie_selection(reviews)
