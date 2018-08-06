class Human
    attr_accessor :strength, :intelligence, :stealth, :health
    
    def initialize
        @strength = 3
        @intelligence = 3
        @stealth = 3
        @health = 100
    end

    def attack enemy
        enemy.class.ancestors.include?(Human) ? enemy.health -= @strength : (puts "Not a human!")
    end
end

bob = Human.new
joe = Human.new

puts "Bobs health : ", bob.health
puts "Joe health : ", joe.health

bob.attack(joe)

puts "Bobs health : ", bob.health
puts "Joe health : ", joe.health

# print joe.class.ancestors