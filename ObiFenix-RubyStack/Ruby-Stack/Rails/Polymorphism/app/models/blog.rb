class Blog < ActiveRecord::Base
    has_many  :owners, dependent: :destroy
    has_many  :posts, dependent: :destroy
    has_many  :users, through: :owners
    has_many  :user_posts, through: :posts, source: :user    # all the users that posted on a specific blog
    has_many  :comments, as: :imageable
    validates :name, :description, presence: true

end
