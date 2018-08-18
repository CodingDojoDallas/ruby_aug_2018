class SongsController < ApplicationController

  def index
    @allsongs = Song.all
    # @allsongs = Song.where(state: current_user.playlists)
    @othersongs = Song.where.not(state: current_user.playlists)
    @songs_added_by = Playlist.where(user_id: current_user.id)
  end

  def create
    @new_song = Song.create(song_params)
    unless @new_song.valid?
      flash[:errors] = @new_song.errors
    end
    redirect_to "/songs"
  end

  # ===================
  # GET Request [.html]
  # GET Request [.json]
  # ===================
  def show
    print "\n\n===============================\n\n"
    puts "BEFORE"
    print "\n\n===============================\n\n"
    @this_song = Song.find(params[:id])
    @playlist = @this_song.playlists
    # session[:song_id] = @this_song.id
  end


  # ======================
  # DELETE Request [.html]
  # DELETE Request [.json]
  # ======================
  def destroy
  Song.find(params[:id]).delete
    redirect_to "/songs"
  end

  private
    def song_params
      params.require(:song).permit(:title, :artist)
    end
end
