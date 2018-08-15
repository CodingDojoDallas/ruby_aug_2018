class User < ActiveRecord::Base
  has_secure_password
  EMAIL_REGEX = /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]+)\z/i
  validates :name, :email, :password, presence: true
  validates :email, uniqueness: true, format: { with: EMAIL_REGEX }
  before_save :downcase_fields

   def downcase_fields
      self.email.downcase!
   end
end
