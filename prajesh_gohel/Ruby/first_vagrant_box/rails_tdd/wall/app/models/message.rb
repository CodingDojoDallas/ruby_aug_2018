class Message < ActiveRecord::Base
  belongs_to :user
  validates :message, presence: true, length: { minimum: 11 }
  validates :user_id, presence: true
end
