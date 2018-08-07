require_relative 'mammal'
class Human < Mammal # Human inherits from Mammal
    def subclass_method
        breath
    end
    def another_method
        self.eat
    end
end
person = Human.new
person.subclass_method
person.another_method