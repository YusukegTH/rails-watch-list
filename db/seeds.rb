require 'json'
require 'open-uri'

top_rated = JSON.parse(URI.open('https://tmdb.lewagon.com/movie/top_rated').read)

top_rated["results"].each { |movie|
  Movie.create(title: movie["title"], overview: movie["overview"], poster_url: "https://image.tmdb.org/t/p/w500/#{movie["poster_path"]}", rating: movie["vote_average"])
}
