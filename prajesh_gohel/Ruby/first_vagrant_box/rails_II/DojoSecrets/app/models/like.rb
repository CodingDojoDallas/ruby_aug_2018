class Like < ActiveRecord::Base
  belongs_to :user
  belongs_to :secret
  validates :user_id, :secret_id, presence: true
end
