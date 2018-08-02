class CreateJoinTableUsersBlogs < ActiveRecord::Migration
  def change
    create_join_table :users, :blogs do |t|
      # t.index [:user_id, :blog_id]
      # t.index [:blog_id, :user_id]
    end
  end
end
