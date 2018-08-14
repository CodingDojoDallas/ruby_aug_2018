class User < ActiveRecord::Base
    validates :username, uniqueness: true, presence: true, length: { minimum: 5 }
    has_many  :comments
    has_many  :messages
end
