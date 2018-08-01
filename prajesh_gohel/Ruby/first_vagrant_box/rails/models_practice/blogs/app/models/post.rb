class Post < ActiveRecord::Base
  belongs_to :blog
  has_many :messages, dependent: :destroy
  validates :title, presence: true, length: {minimum: 7}
  validates :content, presence: true
end
