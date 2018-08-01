require_relative 'myenum_module'

class Array
    include MyEnumerable
end

# Testing output:
[1,2,3,4].my_each { |i| puts i      } # => 1 2 3 4
[1,2,3,4].my_each { |i| print i * 10 + " " } # => 10 20 30 40