# ========================
# Assignment: Ruby Puzzles
# ========================
# => Work on the puzzles below. Make your code as clean as possible.
#    Put all of your answers in a single file and upload below.

# [1]  <> Shall create an array with the following values: 3,5,1,2,7,9,8,13,25,32.
#      <> Shall print the sum of all numbers in the array.
#      <> Shall have the function return an array that only include numbers that are greater than 10
#         (E.g. when you pass the array above, it should return [13,25,32]
#         hint: use reject or find_all method)
# Result:
arr = [3,5,1,2,7,9,8,13,25,32]
puts arr.inject(:+)

arr.each {|num| if num > 10 then puts num end}


# [2]  <> Create an array with the following values: John, KB, Oliver, Cory, Matthew, Christopher. Shuffle the array and print the name of each person.
#      <> Have the program also return an array with names that are longer than 5 characters.
# Result:
#
# => [ Version #1 ]
names = ["John", "KB", "Oliver", "Cory", "Matthew", "Christopher"]
puts names.shuffle
names.find_all {|name| name.length > 5}
#
# OR
#
# => [ Version #2 ]
names = %w(John KB Oliver Cory Matthew Christopher)
puts names.shuffle
names.find_all {|name| name.length > 5}


# [3]  <>  Shall create an array that contains all 26 letters in the alphabet (this array must have 26 values).
#      <>  Shall shuffle the array and display the last letter of the array.
#      <>  Shall display the first letter of the array. If the first letter in the array is a vowel, have it display a message
# Result:
#
alphabet = ("a".."z").to_a
shuffled = alphabet.shuffle
first = shuffled.find { |i| i}
last = shuffled.values_at(25)
# first = shuffled.find{|letter| letter}
# last = shuffled.pop
puts shuffled
puts first
puts last


# [4]  <> Shall generate an array with 10 random numbers between 55-100.
#
# Result:
(55..100).to_a.shuffle[1..10]


# [5]  <> Shall generate an array with 10 random numbers between 55-100
#      <> Shall sort these values (showing the smallest number in the beginning).
#      <> Shall display all the numbers in the arrays.
#      <> Next, display the minimum value in the array as well as the maximum value.
# Result:
arr = (55..100).to_a.shuffle[1..10]
puts arr.sort
puts arr.min.to_s + " is min"
puts arr.max.to_s + " is max"


# [6]  <> Shall create a random string that is 5 characters long
#         (hint: (65+rand(26)).chr returns a random character
# Result:
(1..5).collect {|i| i=(65+rand(26)).chr}.join


# [7]  <> Shall generate an array with 10 random strings that are each 5 characters long
# Result:
strArr = Array.new
10.times { strArr.push((1..5).map{ rand(65..90).chr }.join) }
puts strArr