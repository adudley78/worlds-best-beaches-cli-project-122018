# This is the environment. # Anything that needs the environment can load it through this file.
require 'open-uri'
require 'nokogiri'
require 'pry'

require_relative './worlds_best_beaches/version'
require_relative './worlds_best_beaches/beach'
require_relative './worlds_best_beaches/cli'
require_relative './worlds_best_beaches/scraper'
