class MoviesController < ApplicationController
  before_action :authenticate_user!, only: [:new, :create, :edit]
  
  
  
  def index
    @movies = Movie.all
  end
  def new
    @movie = Movie.new
  end

  def create
    @movie = Movie.new(movie_params)
    if @movie.save
      redirect_to root_path
    else 
      render :new
    end
  end






  private

  def movie_params
    params.require(:movie).permit(:image, :title, :text, :phrase, :genre_id).merge(user_id: current_user.id)
                                 
  end
  
end
