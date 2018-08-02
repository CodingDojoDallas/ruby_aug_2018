class User < ActiveRecord::Base
  # has_and_belongs_to_many :blogs
  has_many :owners
  has_many :posts
  has_many :messages
  has_many :comments
  has_many :commented_to, as: :commentable, source: :comment

  has_many :owned_blogs, through: :owners, dependent: :destroy, source: :blog
  has_many :blogs_posted_on, through: :posts, dependent: :destroy, source: :blog
  has_many :messages_posted_on, through: :messages, dependent: :destroy, source: :post

  validates :first_name, :last_name, :email, presence: true
end
