class User < ActiveRecord::Base
  has_secure_password
  has_many :events, dependent: :destroy # events user created
  has_many :comments, dependent: :destroy # comments user created
  has_many :events_joined, through: :joins, source: :event # events user joined

  EMAIL_REGEX = /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]+)\z/i
  before_validation :downcase_fields

  validates :first_name, :last_name, :email, :city, :state, presence: true
  validates :email, uniqueness: { case_sensitive: false }, format: { with: EMAIL_REGEX }
  validates :state, length: { is: 2 }
  validates :password, length: { minimum: 8, maximum: 15 }, on: :create
  # validates :password, confirmation: true, length: {minimum:8}
  # validates :password_confirmation, presence: true, length: {minimum:8}
  # before_save { |user| user.email = user.email.downcase }
  private
    def downcase_fields
      self.email.downcase!
    end
end
