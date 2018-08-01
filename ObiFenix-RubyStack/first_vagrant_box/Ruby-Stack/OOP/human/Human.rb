# ==================
#  Assignment: Human
# ==================
#
# => Objective:
#    <>  In this assignment, we are going to create a Human class.
# ================================================================

class Human
    attr_accessor :strength, :intelligence, :stealth, :health

    def initialize
        @health = 100
        @strength = 3
        @stealth = 3
        @intelligence = 3
    end
    def display_health
        puts health
    end
    def attack(obj)
        if obj.class.ancestors.include?(Human)
            obj.health -= 10
            true
        else
            false
    end
    end
end

# Testing...
human = Human.new().display_health
