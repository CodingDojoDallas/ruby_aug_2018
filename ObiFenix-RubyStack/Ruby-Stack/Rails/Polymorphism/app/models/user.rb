class User < ActiveRecord::Base
    EMAIL_REGEX = /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]+)\z/i
    has_many  :posts, dependent: :destroy
    has_many  :messsages, dependent: :destroy
    has_many  :owners, dependent: :destroy

    has_many  :comments, as: :imageable                   # Polymorphic relationship
    has_many  :blogs, through: :owners                      # all the blogs owned by a specific user
    has_many  :blog_posts, through: :posts, source: :blog   # all the blogs a user has posted on

    validates :first_name, :last_name, :email, presence: true, length: { in: 2..20 }
    validates :email, presence: true, uniqueness: { case_sensitive: false }, format: { with: EMAIL_REGEX }
end
