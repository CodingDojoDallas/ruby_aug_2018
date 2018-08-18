class Event < ActiveRecord::Base
  belongs_to :user
  has_many   :comments, dependent: :destroy
  has_many   :attends, dependent: :destroy
  # has_many   :joins, dependent: :destroy
  has_many   :users_attending, through: :attends, source: :user

  validates  :name, :date, :city, :state, :user, presence: true
  validate :valid_date
  private
   	def valid_date
       errors.add(:date, "can't be in the past") unless date.future?
   	end
end
