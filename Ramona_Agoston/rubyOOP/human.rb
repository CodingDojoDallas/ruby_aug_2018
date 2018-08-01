class Human
    attr_accessor :health, :strength, :intelligence, :stealth
    def initialize
        @health = 100
        @strength = 3
        @intelligence = 3
        @stealth = 3
    end

    def attack obj
        p obj.class.ancestors
        if obj.class.ancestors == self.class.ancestors
            obj.health -= @strength
        end
    end

    def display_health
        p "Current health is #{@health}"
    end
end

ramo = Human.new
linds = Human.new

ramo.attack(linds)
linds.display_health
