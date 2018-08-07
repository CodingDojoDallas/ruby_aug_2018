# Create an array with the following values: 3,5,1,2,7,9,8,13,25,32. Print the sum of all numbers in the array. Also have the function return an array that only include numbers that are greater than 10 (E.g. when you pass the array above, it should return an array with the values of 13,25,32 - hint: use reject or find_all method)
# array = [3,5,1,2,7,9,8,13,25,32]
# print array.reduce(:+)
# print array.reject{|i| i < 10}

# Create an array with the following values: John, KB, Oliver, Cory, Matthew, Christopher. Shuffle the array and print the name of each person. Have the program also return an array with names that are longer than 5 characters.
# names = ["John", "KB", "Oliver", "Cory", "Matthew", "Christopher"]
# print names.shuffle
# puts names.find_all {|name| name.length > 5}

# Create an array that contains all 26 letters in the alphabet (this array must have 26 values). Shuffle the array and display the last letter of the array. Have it also display the first letter of the array. If the first letter in the array is a vowel, have it display a message
x = ('a'..'z').to_a
s = x.shuffle
puts s.last
puts s.first
puts "The first letter is a vowel!" if ['a', 'e', 'i', 'o', 'u'].include?(s.first)

# Generate an array with 10 random numbers between 55-100.
# print (55..100).to_a.shuffle[1..10]

# Generate an array with 10 random numbers between 55-100 and have it be sorted (showing the smallest number in the beginning). Display all the numbers in the arrays. Next, display the minimum value in the array as well as the maximum value.
# arr = (55..100).to_a.shuffle[1..10]
# puts arr.sort
# puts arr.min.to_s + " is min"
# puts arr.max.to_s + " is max"

# Create a random string that is 5 characters long (hint: (65+rand(26)).chr returns a random character
# print (1..5).collect {|i| i=(65+rand(26)).chr}.join

#Generate an array with 10 random strings that are each 5 characters long
# array_of_strings = Array.new
# 10.times { array_of_strings.push((1..5).map{ rand(65..90).chr }.join) }
# puts array_of_strings