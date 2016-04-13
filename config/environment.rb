require 'bundler/setup'
Bundler.require

require 'pry'
require 'nokogiri'
require 'rest-client'

require_relative "../concerns/Textable.rb"
require_relative "../CLI/CLI.rb"
require_relative "../data_fetchers/api_communicator.rb"
require_relative "../models/Review.rb"
require_relative "../models/User.rb"
