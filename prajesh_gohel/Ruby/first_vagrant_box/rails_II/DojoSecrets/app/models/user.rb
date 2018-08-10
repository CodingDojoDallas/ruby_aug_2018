class User < ActiveRecord::Base
  EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-]+(\.[a-z\d\-]+)*\.[a-z]+\z/i
  has_secure_password
  validates :name, presence: true
  validates :email, presence: true, format: { with: EMAIL_REGEX }, uniqueness: true
  before_save :downcase_fields

  def downcase_fields
    self.email.downcase!
  end
end
