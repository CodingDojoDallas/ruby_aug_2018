# =================
#  Assignment: Dog
# =================
#
# => Objective:
#    <>  Create a file mammal.rb, then within it...
#          o  create a Mammal Class with the following characteristics
#             - shall have a default health attribute with value of 150.
#             - shall have a method called display_health, which when invoked, prints the health of the Mammal.
#    <> Create a separate file (dog.rb), containing a class called Dog that inherits from the Mammal class and do the following:
# ==================================================

require_relative "mammal"

class Dog < Mammal
    def pet
        @health = @health + 5
        self
    end
    def walk
        @health = @health - 1
        self
    end
    def run
        @health = @health - 10
        self
    end
end

puts "================== [ Animal Stats:  Dog ]"
dog = Dog.new.walk.walk.walk.run.run.pet.pet.display_health
puts dog