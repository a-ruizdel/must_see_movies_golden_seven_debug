class MoviesController < ApplicationController
  def index
    @movies = Movie.all
  end

  def show
    @movie = Movie.find(params["id"])
    render("movies/show.html.erb")
  end

  def new_form
  end

  def create_row
    m = Movie.new
    m.movie_title = params["the_title"]
    m.movie_year = params["the_year"]
    m.movie_duration = params["the_duration"]
    m.movie_description = params["the_description"]
    m.movie_image_url = params["the_image_url"]
    m.movie_director_id = params["the_director_id"]
    m.save

    render("/movies/show.html.erb")
  end

  def edit_form
    @movie = Movie.find(params[:id])
  end

  def update_row
    @movie.title = params[:title]
    @movie.year = params[:year]
    @movie.duration = params[:duration]
    @movie.description = params[:description]
    @movie.image_url = params[:image_url]
    @movie.director_id = params[:director_id]

    render("show")
  end

  def destroy
    @movie = Movie.find(params["id"])

    @movie.destroy
  end
end
