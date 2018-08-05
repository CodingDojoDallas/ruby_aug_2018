class Comment < ActiveRecord::Base
  belongs_to :imageable, polymorphic: true
  validates :comment, presence: true, length: { minimum: 3 }
end
