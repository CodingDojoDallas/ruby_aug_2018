class CreatePlaylists < ActiveRecord::Migration
  def change
    create_table :playlists do |t|
      t.integer :user_id
      t.integer :song_id

      t.timestamps null: false
    end
  end
end
