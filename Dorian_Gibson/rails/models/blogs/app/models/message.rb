class Message < ActiveRecord::Base
    belongs_to :post
    belongs_to :user
    validates :author, presence: true, length: { in: 2..255 }
    validates :message, presence: true, length: { minimum: 15 }
end
