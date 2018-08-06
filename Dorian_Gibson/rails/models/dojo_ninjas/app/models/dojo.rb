class Dojo < ActiveRecord::Base
    has_many :ninjas
    validates :name, :city, presence: true, length: { in: 2..255 }
    validates :state, presence: true, length: {is: 2}
end
