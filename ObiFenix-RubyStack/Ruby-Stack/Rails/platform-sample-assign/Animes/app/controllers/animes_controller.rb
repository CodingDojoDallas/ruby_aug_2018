class AnimesController < ApplicationController

  def index
    @animes = Anime.all
  end

  def new
    Anime.new
  end

  def create
    @anime = Anime.create(validate_params)
    redirect_to "/animes"
  end

  private
    def validate_params
      params.require(:anime).permit(:title)
    end
end
