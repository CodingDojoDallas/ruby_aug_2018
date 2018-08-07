x = (1..5)
puts "Class Name: #{x.class}"
puts "It does include 3!" if x.include? 3
puts "the last number of this range is " + x.last.to_s
puts "the min number of this range is " + x.min.to_s
puts "the max number of this range is " + x.max.to_s

#more complicated example
y = ('a'..'z')
puts y.to_a.shuffle.to_s #takes a range, turns it into an array, shuffles it and then turns it back into a string