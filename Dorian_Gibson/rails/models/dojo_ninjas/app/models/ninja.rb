class Ninja < ActiveRecord::Base
  belongs_to :dojo
  validates :first_name, :last_name, presence: true, length: { in: 2..20 }
end
