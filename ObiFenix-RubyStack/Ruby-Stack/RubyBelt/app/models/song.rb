class Song < ActiveRecord::Base
  has_many   :playlists, dependent: :destroy
  has_many   :users, through: :playlists, dependent: :destroy # all the users that added on a specific song
  validates  :title, :artist, presence: true
end
