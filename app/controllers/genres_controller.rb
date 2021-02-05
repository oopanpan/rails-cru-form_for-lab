class GenresController < ApplicationController
  before_action :find_genre, only: [:show, :edit]

  def index
    @genres = Genre.all
  end

  def new
    @genre = Genre.new
  end

  def create
    @genre = Genre.create(genre_params)
    redirect_to genre_path(@genre)
  end
  
  def update
    @genre = Genre.new
    @genre.update(genre_params)
    redirect_to genre_path(@genre)
  end

  def find_genre
    @genre = Genre.find(params[:id])
  end

  private

  def genre_params
    params.require(:genre).permit(:name)
  end
end
