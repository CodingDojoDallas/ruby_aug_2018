class Blog < ActiveRecord::Base
  # has_and_belongs_to_many :users
  has_many :owners
  has_many :posts
  has_many :comments, as: :commentable

  has_many :users_owned_by, through: :owners, dependent: :destroy, source: :user
  has_many :users_posted_by, through: :posts, dependent: :destroy, source: :user

  validates :name, :desc, presence: true
end
