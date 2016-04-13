require 'bundler/setup'
Bundler.require

require 'pry'
require 'nokogiri'
require 'rest-client'
require 'yaml'

require_relative "../lib/concerns/Textable.rb"
require_relative "../lib/cli/cli.rb"
require_relative "../lib/data_fetchers/api_communicator.rb"
require_relative "../lib/data_fetchers/nytimes_scraper.rb"
require_relative "../lib/models/Review.rb"
require_relative "../lib/models/User.rb"
