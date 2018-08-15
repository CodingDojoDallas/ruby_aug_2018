class Student < ActiveRecord::Base
  EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-]+(\.[a-z\d\-]+)*\.[a-z]+\z/i
  belongs_to :dojo
  validates :first_name, :last_name, :email, presence: true, length: {minimum: 2}
  validates :email, uniqueness: { case_sensitive: false }, format: { with: EMAIL_REGEX }
end
