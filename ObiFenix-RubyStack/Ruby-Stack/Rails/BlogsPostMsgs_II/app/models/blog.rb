class Blog < ActiveRecord::Base
    has_many  :owners, dependent: :destroy
    has_many  :posts, dependent: :destroy
    has_many  :users, through: :owners
    has_many  :user_posts, through: :posts, source: :user    # all the users that posted on a specific blog
    validates :name, :description, presence: true

end
