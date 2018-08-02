class Post < ActiveRecord::Base
  belongs_to :blog
  belongs_to :user

  has_many :messages
  has_many :comments, as: :commentable

  has_many :users, through: :messages, dependent: :destroy

  validates :title, presence: true, length: {minimum: 7}
  validates :content, presence: true
end
