require_relative "human"

class Samurai < Human   # 'super-class' Inheriting from Human class
    @@no_of_samurai = 0

    def initialize
        @health = 200
        @@no_of_samurai += 1
    end

    def death_blow(obj)
        attack(obj)
        obj.health = 0
    end

    def meditate
        @health = 200
    end

    def how_many
        puts @@no_of_samurai
    end

end