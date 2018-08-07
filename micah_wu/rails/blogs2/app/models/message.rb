class Message < ActiveRecord::Base
  belongs_to :user
  belongs_to :post
  has_many :comments, as: :imageable
end
