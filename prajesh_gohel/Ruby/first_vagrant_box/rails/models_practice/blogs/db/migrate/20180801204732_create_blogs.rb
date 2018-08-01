class CreateBlogs < ActiveRecord::Migration
  def change
    create_table :blogs do |t|
      t.string :name
      t.text :desc

      t.timestamps null: false
    end
  end
end
