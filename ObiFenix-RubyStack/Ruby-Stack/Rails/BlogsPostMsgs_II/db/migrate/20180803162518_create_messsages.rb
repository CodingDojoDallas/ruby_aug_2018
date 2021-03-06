class CreateMesssages < ActiveRecord::Migration
  def change
    create_table :messsages do |t|
      t.references :post, index: true, foreign_key: true
      t.references :user, index: true, foreign_key: true
      t.string :author
      t.text :message

      t.timestamps null: false
    end
  end
end
