class Blog < ActiveRecord::Base
    has_many :owners
    has_many :posts
    has_many :post_users, through: :posts, source: :user
    has_many :owners_users, through: :owners, source: :user
    has_many :post_messages, through: :posts, source: :message
    has_many :comments, as: :imageable
end
