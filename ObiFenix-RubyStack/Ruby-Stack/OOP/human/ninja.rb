require_relative "human"

class Ninja < Human     # 'super-class' Inheriting from Human class

    def initialize
        @stealth = 175
    end

    def steal(obj)
        attack(obj)
        @health += 10
    end

    def get_away
        @health -= 15
    end
end