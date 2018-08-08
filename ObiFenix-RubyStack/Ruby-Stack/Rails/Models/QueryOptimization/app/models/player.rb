class Player < ActiveRecord::Base
  belongs_to :team
  validates  :name, presence: true, length: { minimum: 3 }
end
