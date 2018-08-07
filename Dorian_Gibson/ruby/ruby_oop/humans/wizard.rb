require_relative Human

class Wizard < Human

    def initialize
        @intelligence = 25
        @health = 50
    end

    def heal
        @health <= 50 && @health > 40 ? @health = 50 : @health += 10
    end

    def fireball enemy
        enemy.class.ancestors.include?(Human) ? enemy.health -= 20 : (puts "Not a human!")
    end

end