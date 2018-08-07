class Dojo < ActiveRecord::Base
    has_many :ninjas, :dependent => :delete_all
    validates :name, :city, :state, presence: true, length: { minimum: 2 }
end
