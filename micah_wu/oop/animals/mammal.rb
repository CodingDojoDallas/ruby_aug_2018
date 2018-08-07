class Mammal
    def initialize
        @health = 150
    end
    def display_health
        puts "Health: #{@health}"
    end
end
mammal = Mammal.new