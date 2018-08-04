class CreateTests < ActiveRecord::Migration
  def change
    create_table :tests do |t|
      t.string :testA

      t.timestamps null: false
    end
  end
end
