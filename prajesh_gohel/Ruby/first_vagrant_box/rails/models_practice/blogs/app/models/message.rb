class Message < ActiveRecord::Base
  belongs_to :post
  validates :author, presence: true
  validates :message, presence: true, length: {minimum: 15}
end
