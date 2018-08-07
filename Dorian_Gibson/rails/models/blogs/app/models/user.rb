class User < ActiveRecord::Base
    EMAIL_REGEX = /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]+)\z/i
    has_many :posts
    has_many :messages
    has_many :owners
    has_many :comments, as: :imageable
    has_many :blogs, through: :owners
    validates :first_name, :last_name, presence: true
    validates :email_address, presence: true, uniqueness: { case_sensitive: false }, format: { with: EMAIL_REGEX }
end
