require 'bundler/setup'
Bundler.require

require 'pry'
require 'nokogiri'
require 'rest-client'
require 'yaml'

require_relative "../CLI/CLI.rb"
require_relative "../data_fetchers/api_communicator.rb"
require_relative "../models/Review.rb"
require_relative "../models/User.rb"
require_relative "../data_fetchers/nytimes_scraper.rb"