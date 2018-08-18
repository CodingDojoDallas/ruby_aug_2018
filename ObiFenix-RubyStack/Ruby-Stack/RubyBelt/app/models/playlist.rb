class Playlist < ActiveRecord::Base
  belongs_to  :song
  belongs_to  :user
  # has_many  :users_added, through: :songs, source: :user
end
