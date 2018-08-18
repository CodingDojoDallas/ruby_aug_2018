class Attendee < ActiveRecord::Base
  belongs_to :user
  belongs_to :event

  validates :event, :user, presence: true
end
