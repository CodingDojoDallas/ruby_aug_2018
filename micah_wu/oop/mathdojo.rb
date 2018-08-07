class MathDojo
    def initialize
        @result = 0
        self
    end
    def add (*arguments)
        sum = 0
        arguments.flatten.each do |i|
            sum += i
        end
        @result += sum
        self
    end
    def subtract(*arguments)
        sum = 0
        arguments.flatten.each do |i|
            sum -= i
        end
        @result += sum
        self
    end
    def result
        puts @result
    end
end
challenge1 = MathDojo.new.add(2).add(2, 5).subtract(3, 2).result # => 4
challenge2 = MathDojo.new.add(1).add([3, 5, 7, 8], [2, 4.3, 1.25]).subtract([2,3], [1.1, 2.3]).result # => 23.15


# class Mammal
#     def initialize
#       puts "I am alive"
#       self
#     end
#     def breath  
#       puts "Inhale and exhale"
#       self
#     end
    
#     def who_am_i
#       # printing the current object
#       puts self
#       self
#     end
#   end
#   my_mammal = Mammal.new # => "I am alive"
#   my_mammal.who_am_i # => #<Mammal:0x007f9e86025dd8>
#   my_mammal.who_am_i.breath # => undefined method `breath' for nil:NilClass (NoMethodError)