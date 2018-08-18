class PlaylistsController < ApplicationController

  def add_to_playlist
    Playlist.create(song_id: params[:id], user_id: current_user.id)
    redirect_to songs_path
  end


  # ======================
  # DELETE Request [.html]
  # DELETE Request [.json]
  # ======================
  def remove_from_playlist
    current_user.playlists.where(song_id: params[:id]).delete
    redirect_to "/songs"
  end

  private
    def song_params
      params.require(:song).permit(:title, :artist)
    end
end
