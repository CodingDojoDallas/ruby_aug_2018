require_relative "human"

class Wizard < Human    # 'super-class' Inheriting from Human class
    def initialize
        @health = 50
        @intelligence = 25
    end
    def heal
        @health += 10
    end
    def fireball(obj)
        obj.health -= 20
    end
end