class User < ActiveRecord::Base
    has_many :messages
    has_many :posts
    has_many :owners
    has_many :owning_blogs, through: :owners, source: :blog
    has_many :posts_blogs, through: :posts, source: :blog
    has_many :comments, as: :imageable
end
