class User < ActiveRecord::Base
    EMAIL_REGEX = /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]+)\z/i
    validates :first_name, :last_name, :email, :city, :state, presence: true
    validates :password, presence: true, length:{minimum:8}, on: :create
    validates :email, uniqueness:{case_sensitive:false}, format:{with:EMAIL_REGEX}
  has_secure_password
  has_many :events
  has_many :joins
  has_many :joined_events, through: :joins, source: :event
  has_many :comments
end
