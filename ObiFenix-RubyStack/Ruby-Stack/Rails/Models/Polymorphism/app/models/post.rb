class Post < ActiveRecord::Base
  belongs_to :blog
  belongs_to :user
  has_many   :comments, as: :imageable        # Polymorphic Relationship
  has_many   :messsages, dependent: :destroy
  has_many   :users, through: :messages, dependent: :destroy
  validates  :title, :content, presence: true
end
