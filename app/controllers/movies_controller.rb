class MoviesController < ApplicationController
before_action :find_movie, only: [:show, :edit, :update, :destroy]
before_action :authenticate_user!, only: [:new, :edit]

	def index
		
		if params[:filter] == "title"
			@movies = Movie.all.order("title ASC")
		else #params[:filter] == "release_date" 
			@movies = Movie.all.order("created_at ASC")
		end

	end

	def show
		if @movie.reviews.blank?
			@average_review = 0
		else
			@average_review = @movie.reviews.average(:rating).round(2)
		end
	end

	def new
		@movie = current_user.movies.build
	end

	def create
		@movie = current_user.movies.build(movie_params)

		if @movie.save
			redirect_to root_path
		else
			render 'new'
		end
	end

	def edit
		
	end

	def update
		if @movie.update(movie_params)
			redirect_to movie_path(@movie)
		else
			render 'edit'
		end
	end

	def destroy
		@movie.destroy
		redirect_to root_path
	end

	private

		def movie_params
			params.require(:movie).permit(:title, :description, :image)
		end

		def find_movie
			@movie = Movie.find(params[:id])
		end

end
