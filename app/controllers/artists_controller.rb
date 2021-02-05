class ArtistsController < ApplicationController
  before_action :find_artist, only: [:show, :edit]

  def index
    @artists = Artist.all
  end

  def new
    @artist = Artist.new
  end

  def create
    @artist = Artist.create(artist_params)
    redirect_to artist_path(@artist)
  end
  
  def update
    @artist = Artist.new
    @artist.update(artist_params)
    redirect_to artist_path(@artist)
  end

  def find_artist
    @artist = Artist.find(params[:id])
  end

  private

  def artist_params
    params.require(:artist).permit(:name, :bio)
  end
end
