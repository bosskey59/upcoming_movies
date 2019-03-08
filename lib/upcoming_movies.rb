require_relative "upcoming_movies/version"
require "open-uri"
require "nokogiri"
require "pry"

module UpcomingMovies
  class Error < StandardError; end
  # Your code goes here...
end

require_relative "upcoming_movies/cli"
require_relative "upcoming_movies/scraper"
require_relative "upcoming_movies/movie"
