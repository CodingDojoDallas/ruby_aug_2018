class Post < ActiveRecord::Base
  belongs_to :user
  belongs_to :blog
  has_many :messages
  has_many :comments, as: :imageable
end
