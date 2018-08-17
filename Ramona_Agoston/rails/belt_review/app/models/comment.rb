class Comment < ActiveRecord::Base
  validates :comment, presence: true
  belongs_to :event
  belongs_to :user
end
