class MoviesController < ApplicationController
  before_action :authenticate_user!
  before_action :baria_user, only: [:edit, :destroy, :update]
  
  
  def index
    @user = current_user

    @movies = Movie.where(user_id: @user.id)
    #@movie1 = Movie.where(user_id: @user.id, genre_name: "アクション")
    #@movie2 = Movie.where(user_id: @user.id, genre_name: "SF")

    
    @genres = Genre.all
    #gon.genre = @genres
    

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
  def show
    @movie = Movie.find(params[:id])
    gon.movie = @movie
  end

  def edit
    @movie = Movie.find(params[:id])
  end

  def update
    @movie = Movie.find(params[:id])
    if @movie.update(movie_params)
      redirect_to movie_path
    else
      render :edit
    end
  end

    def destroy
      @movie = Movie.find(params[:id])
      if @movie.destroy
        redirect_to root_path
      end
    end
  
def genre
  genre_id = params[:genre_id]
  @genre = Genre.find_by(id: genre_id)

  @movies_genre = Movie.where(genre_id: @genre)
  binding.pry
end





  private

  def movie_params
    params.require(:movie).permit(:image, :title, :text, :phrase, :genre_id).merge(user_id: current_user.id)                      
  end

  def genre_params
    params.rewuire(:genre).permit(:id)
  end

  def baria_user
    unless Movie.find(params[:id]).user.id.to_i == current_user.id
        redirect_to root_path(current_user)
    end
  end



end
