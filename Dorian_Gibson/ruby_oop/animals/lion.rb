require_relative 'mammal'

class Lion < Mammal 
    def initialize()
        self.health = 170 
    end

    def fly
        self.health -= 10
        self
    end

    def attack_town
        self.health -= 50
        self
    end

    def eat_humans
        self.health += 20
        self
    end

    def lion_health
        puts 'This is a lion'
        self.display_health
        self
    end
end

lion = Lion.new.attack_town.attack_town.attack_town.eat_humans.eat_humans.fly.fly.lion_health
# lion.attack_town.attack_town.attack_town.eat_humans.eat_humans.fly.fly.display_health
