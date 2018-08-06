# ======================
#  Assignment: MathDojo
# ======================
#
# => Objective:
#    <>  Create a MathDojo class that will allow you to add and subtract numbers.
#    <>  Practice method chaining and splat Operator
# ==================================================

class MathDojo
    attr_accessor :result

    def initialize
        @result = 0
    end

    def add *arg
        if arg.class == Array
            @result += arg.flatten.inject(:+)
        else
            @result += arg
        end
        self
    end

    def subtract *arg
        if arg.class == Array
            @result -= arg.flatten.inject(:+)
        else
            @result -= arg
        end
        self
    end
end


challenge1 = MathDojo.new.add(2).add(2, 5).subtract(3, 2).result # => 4
challenge2 = MathDojo.new.add(1).add([3, 5, 7, 8], [2, 4.3, 1.25]).subtract([2,3], [1.1, 2.3]).result # => 23.15

# Outputs Challenges
puts
puts "Output of 1st Challenge: #{challenge1}"
puts "Output of 2nd Challenge: #{challenge2}"
puts