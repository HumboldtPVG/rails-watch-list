require 'json'
require 'open-uri'
List.destroy_all

Movie.destroy_all

url = 'http://tmdb.lewagon.com/movie/top_rated?api_key=<your_api_key>'
info_serialized = URI.open(url).read
info = JSON.parse(info_serialized)
p info
results = info["results"]

results.take(25).each do |movie|
  m = Movie.create!(title: movie["title"], overview: movie["overview"], poster_url: movie["poster_path"], rating: movie["vote_average"])
  puts "created a movie: #{m.title}!"
end

