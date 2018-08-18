class CreateAnimes < ActiveRecord::Migration
  def change
    create_table :animes do |t|
      t.string :title
      
      t.timestamps null: false
    end
  end
end
