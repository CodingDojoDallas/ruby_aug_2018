# =================
#  Assignment: Lion
# =================
#
# => Objective:
#    <>  Utilize 'superclass' to create another class that inherits from mammal.rb,
# ==================================================

require_relative "mammal"

class Lion < Mammal

    def initialize
        @health = 170
        self
    end
    def fly
        @health = @health - 10
        self
    end
    def attack_town
        @health = @health - 50
        self
    end
    def eat_humans
        @health = @health + 20
        self
    end
    def display_health
        puts "================== [ Animal Stats:  Lion ]"
        puts "This is a Lion! #{health}"
    end
end


lion = Lion.new.attack_town.attack_town.attack_town.eat_humans.eat_humans.fly.fly.display_health
puts lion