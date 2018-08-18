class Student < ActiveRecord::Base
  belongs_to :dojo
  validates  :first_name, :last_name, :email, presence: true, length: { in: 2..25 }
  validates  :email, uniqueness: { case_sensitive: false }
end