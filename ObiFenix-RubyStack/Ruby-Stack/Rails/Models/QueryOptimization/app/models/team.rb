class Team < ActiveRecord::Base
    has_many    :players
    validates   :name, :mascot, :stadium, presence: true
    validates   :name, length: { minimum: 3 }
end
