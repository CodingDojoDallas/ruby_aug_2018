class Secret < ActiveRecord::Base
  validates  :content, presence: true
  belongs_to :user
  has_many   :likes, dependent: :destroy
  has_many   :users, through: :likes 
end
