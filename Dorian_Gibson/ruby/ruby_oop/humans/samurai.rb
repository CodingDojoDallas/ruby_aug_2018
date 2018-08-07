require_relative Human

class Samurai < Human

    @@num_of_samurai = 0

    def initialize
        @health = 200
        @@num_of_samurai += 1
    end

    def death_blow enemy
        enemy.class.ancestors.include?(Human) ? enemy.health = 0 : (puts "Not a human!")
    end

    def meditate
        @health = 200
    end

    private
        def how_many
            puts "Number of Samurais #{@@num_of_samurai}"
        end
end