
# Create an array with the following values: 3,5,1,2,7,9,8,13,25,32. Print the sum of all numbers in the array. Also have the function return an array that only include numbers that are greater than 10 (e.g. when you pass the array above, it should return an array with the values of 13,25,32 - hint: use reject or find_all method)

x = [3, 5, 1, 2, 7, 9, 8, 13 ,25, 32]
puts x.inject(0){|sum,i| sum + i }
puts x.reject { |i| i <= 10 }

# Create an array with the following values: John, KB, Oliver, Cory, Matthew, Christopher. Shuffle the array and print the name of each person. Have the program also return an array with names that are longer than 5 characters.

x = ["John", "KB", "Oliver", "Cory", "Matthew", "Christopher"]
puts x.shuffle
y = x.find_all { |i| i.length > 5 }
puts y.join(", ")

# Create an array that contains all 26 letters in the alphabet (this array must have 26 values). Shuffle the array and display the last letter of the array. Have it also display the first letter of the array. If the first letter in the array is a vowel, have it display a message.

x = ('a'..'z').to_a
s = x.shuffle
puts s.last
puts s.first
puts "The first letter is a vowel!" if ['a', 'e', 'i', 'o', 'u'].include?(s.first)

# Generate an array with 10 random numbers between 55-100.

r = Random.new
y = 1.upto(10) { |i| puts r.rand(55..100) }

# Generate an array with 10 random numbers between 55-100 and have it be sorted (showing the smallest number in the beginning). Display all the numbers in the array. Next, display the minimum value in the array as well as the maximum value

r = Random.new
y = []
10.times { |i| y.push(r.rand(55..100)) }
y.sort!
p y
puts "Min: #{y.min}"
puts "Max: #{y.max}"

# Create a random string that is 5 characters long (hint: (65+rand(26)).chr returns a random character)

x = (1..5).collect { (65+rand(26)).chr }
puts x.to_s

# Generate an array with 10 random strings that are each 5 characters long

arr = []
x = (1..5).collect { (65+rand(26)).chr }
5.times { |i| arr.push(x.to_s) }
puts arr

=end
