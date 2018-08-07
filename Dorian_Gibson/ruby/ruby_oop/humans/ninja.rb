require_relative Human

class Ninja < Human

    def initialize
        @stealth = 175
    end

    def steal enemy
        attack(enemy)
        @health <= 100 && @health > 90 ? @health = 100 : @health += 10
    end

    def get_away
        @health -= 15
    end
end