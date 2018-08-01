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

class Wizard < Human
    def initialize
        super
        @health = 50
        @intelligence = 25
    end

    def heal
        if @health <= 40
            @health += 10
            p "Wizard's health is now #{@health}"
            self
        else
            @health = 50
            p "Wizard's health is now #{@health}"
            self
        end
    end

    def fireball obj
        obj.health -= 20
        p "The enemies health is #{obj.health}"
        self
    end
end

merlin = Wizard.new
merlin.fireball(ramo)

class Ninja < Human
    def initialize
        super
        @stealth = 175
    end

    def steal obj
        @health += 10
        self
    end

    def get_away
        @health -= 15
        self
    end
end

dojo = Ninja.new
dojo.steal(linds)
dojo.get_away
dojo.display_health

class Samurai < Human
    @@total_number_of_samurai = 0
    def initialize
        super
        @health = 200
        @@total_number_of_samurai +=1
    end

    def death_blow obj
        obj.health = 0
        self
    end

    def meditate
        @health = 200
        self
    end

    def how_many
        p "There are #{@@total_number_of_samurai} Samurai that exist!"
        self
    end
end

mori = Samurai.new
mori.death_blow(linds)
mori2 = Samurai.new
linds.display_health
mori.meditate
mori.how_many
