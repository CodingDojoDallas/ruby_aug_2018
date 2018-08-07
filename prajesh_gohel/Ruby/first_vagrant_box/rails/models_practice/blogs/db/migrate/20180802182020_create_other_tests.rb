class CreateOtherTests < ActiveRecord::Migration
  def change
    create_table :other_tests do |t|
      t.string :testB

      t.timestamps null: false
    end
  end
end
