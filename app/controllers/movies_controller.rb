class MoviesController < ApplicationController
  before_action :set_movie, only: [:show, :edit, :update, :destroy]

  respond_to :html

  def index
    @movies = Movie.all
    respond_with(@movies)
  end

  def show
    respond_with(@movie)
  end

  def new
    @movie = Movie.new
    respond_with(@movie)
  end

  def edit
  end

  def create
    @movie = Movie.new(movie_params)
    @movie.save
    respond_with(@movie)
  end

  def update
    @movie.update(movie_params)
    respond_with(@movie)
  end

  def destroy
    @movie.destroy
    respond_with(@movie)
  end

  private
    def set_movie
      @movie = Movie.find(params[:id])
    end

    def movie_params
      params.require(:movie).permit(:title, :hotness, :image_url, :synopsis, :rating, :genre, :director, :release_date, :runtime, :user_id)
    end
end
