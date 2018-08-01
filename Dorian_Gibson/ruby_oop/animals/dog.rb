require_relative 'mammal'

class Dog < Mammal
    def pet
        self.health+=5
        self
    end

    def walk
        self.health-=1
        self
    end

    def run 
        self.health-=10
        self
    end
end
dog = Dog.new
dog.walk.walk.walk.run.run.pet.display_health