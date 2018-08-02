class CreateMessages < ActiveRecord::Migration
  def change
    create_table :messages do |t|
      t.string :author
      t.string :message
      t.references :post

      t.timestamps null: false
    end
  end
end
