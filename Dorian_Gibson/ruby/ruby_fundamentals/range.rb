x = (3..30)
y = ('b'..'g')

puts "The last number of range x is " + x.last.to_s
puts "The max number of range x is " + x.max.to_s
puts "The min number of range x is " + x.min.to_s
puts "Is the letter x included in range y " + y.include?('x').to_s
puts "Is the letter b included in range y " + y.include?('b').to_s
