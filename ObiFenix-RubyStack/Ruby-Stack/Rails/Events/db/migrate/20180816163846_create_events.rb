class CreateEvents < ActiveRecord::Migration
  def change
    create_table :events do |t|
      t.string :name
      t.date :date
      t.string :city
      t.string :state
      t.integer :user_id

      t.timestamps null: false
    end
  end
end
