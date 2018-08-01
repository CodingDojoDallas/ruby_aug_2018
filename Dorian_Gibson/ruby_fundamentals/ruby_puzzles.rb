require 'active_support'
require 'active_support/core_ext'


#Puzzle 1
def puzzle1
    arr = [3,5,1,2,7,9,8,13,25,32]
    puts arr.sum
    print arr.reject!{|i| i < 10}
end
puzzle1

#Puzzle 2
def puzzle2
    arr = ["John", "KB", "Oliver", "Cory", "Matthew", "Christopher"]
    puts arr.shuffle
    puts
    puts arr.reject!{|i| i.length < 6}
end
puzzle2

#Puzzle 3
def puzzle3 
    arr = ["a","b","c","d","e","f","g","h","i","j","k","l","m","n","o","p","q","r","s","t","u","v","w","x","y","z"]
    arr.shuffle!
    vowel = 'aeiou'
    puts 'Last letter '+ arr.last
    puts arr.first
    puts "it's a vowel" if vowel.include?(arr.first)
end
puzzle3

#Puzzle 4
def puzzle4 
    arr = Array.new(10) {rand(55..100)}
    puts arr
end
puzzle4

#Puzzle 5
def puzzle5
    arr = Array.new(10) {rand(55..100)}
    arr.sort!
    puts arr
    puts "Min: %d Max: %d" % [arr.first, arr.last] 
end
puzzle5

#Puzzle 6
def puzzle6
    str = (0...5).map { (65 + rand(26)).chr }.join
    puts str
end
puzzle6

#Puzzle 7
def puzzle7
    arr = Array.new(10) {(0...5).map { (65 + rand(26)).chr }.join}
    print arr
end
puzzle7
