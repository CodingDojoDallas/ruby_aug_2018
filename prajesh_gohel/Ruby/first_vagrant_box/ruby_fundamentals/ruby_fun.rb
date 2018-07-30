=begin

# x = 5; y = 10; z = x + y
#
# puts z

first_name = "Prajesh"
last_name = "Gohel"

puts "Your Name is: "+first_name+" "+last_name

puts "First name is #{first_name} and last name is #{last_name}"

#OR

puts "First name is %s and last name is %s" % [first_name, last_name]

z = 50
puts "Value of z is #{z}"

#OR

puts "Value of z is %d" % z

puts "\tI am\n 5'10\" tall"



x = "josh, matt, riya, ockman"

y = ""

puts "Y is empty" if y.empty?

x = 5

# if x > 2
#   puts "x is greater than 2"
#
# elsif x <= 2 and x != 0
#   puts "x is 1"
#
# else
#   puts "I can't guess the number"

# puts "x is not 2" if x != 2
# puts "x is greater than 2" if x > 2
# puts "x is not 2" unless x == 2 #Same thing as the first one

age = 19
case age
when 0..2
  puts "baby"

when 3..6
  puts "little child"

when 7..12
  puts "child"

when 13..18
  puts "youth"
else
  puts "adult"
end

a = ["Riya", "Josh", "Matt", "Ockman", "Juliana", "Felecia"]
b = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10]
c = ["Riya", 9]

# returns the last value or the 0th index of the array
# puts a[0]

# x = (a+b)-c
# puts x.to_s

# puts b.class
# puts a.shuffle.join("-")

# puts a.to_s

# using .at
# puts a.at(5)
# puts b.fetch(3)

# using .delete
# a.delete("Josh")
# puts a

# using .push
# a.push("Prajesh")
# puts a

# using .pop
# b.pop(5)
# puts b

# using .length
# puts "Length of a is #{a.length}"

# using .join
# puts a.join(", ")
#
# using .reverse
# puts b.reverse

# using .shuffle
# puts b.shuffle

# Alternative way of creating an array %w{}
# d = %w{hello i am an array created differently}

# using .slice
# puts b.slice(4)
# puts b


# Iterators:

# .any? { |obj| block }
puts ["ant", "bear", "cat"].any? { |word| word.length >= 3 }

# .each { |obj| block }
puts ["ant", "bear", "cat"].each { |word| print word, "--" }

# .collect { |obj| block }
puts (1..4).collect { |i| i*i }
puts (1..4).collect { "cat" }

# .detect/find { |obj| block }
puts (1..10).detect { |i| i %5 == 0 and i % 7 == 0 }
puts (1..100).detect { |i| i %5 == 0 and i % 7 == 0 }

# .find_all { |obj| block }
puts (1..10).find_all { |i| i % 3 == 0 }

# .reject { |obj| block }
puts (1..10).reject { |i| i % 3 == 0 }

# .upto(limit) { |obj| block }
puts 5.upto(10) { |i| print i, " " }

=end

# Blocks:

def test
  puts "You are in the method"
  yield
  puts "You are again back to the method"
  yield
end
test { puts "You are in the block" }

def test
  yield(5)
  puts "You are in the method test"
  yield(100)
end
test { |i| puts "You are in the block #{i}" }

def square(num)
  puts "num is #{num}"

  x = yield(num)
  puts "x has a value of #{x}"

  y = yield(num)*x
  puts "y has a value of #{y}"
end

square(5) { |i| i*i }
