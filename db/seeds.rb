# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

@movies = Tmdb::Movie.popular.results
@movies.each do |movie|
	@movies = Movie.create(title: movie.title, description: movie.overview, image: movie.poster_path)
end