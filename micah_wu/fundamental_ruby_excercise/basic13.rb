#print all numbers from 1 to 255
# print (1..255).collect { |i| i } 
# print (1..255).map { |i| i }


#print odd numbers between 1 to 255
# print (1..255).find_all { |num| num.odd? } 
# print (1..255).select {|num| num.odd? }
#(1..255).steps(2){|x| puts x}


#print sum from 0 to 255
# sum = 0
# x = (0..255)
# puts x.map {|x| "New number: #{x} Sum: #{sum += x}"}

#iterating through an array
#Given an array X, say [1,3,5,7,9,13], write a program that would iterate through each member of the array and print each value on the screen. 
# X = [1,3,5,7,9,13]
# X.each {|x| puts x }

#Find Max
# x = [-5,2,-7,0,1]
# puts x.max

#Get Average
# x = [-5,2,-7,0,1]
# len = x.length
# total = x.inject(:+)
# puts avg=total/len

#Array with Odd Numbers
# Write a program that creates an array 'y' that contains all the odd numbers between 1 to 255. When the program is done, 'y' should have the value of [1, 3, 5, 7, ... 255].
# print y = (1..255).find_all { |i|  i % 2 != 0 }
# print y = (1..255).select { |i| i.odd? }

#Greater Than Y
# Write a program that takes an array and returns the number of values in that array whose value is greater than a given value y. For example, if array = [1, 3, 5, 7] and y = 3, after your program is run it will print 2 (since there are two values in the array that are greater than 3).
# def greater(array, y)
#     x = array.count { |i| i > y }
#     puts x
# end
# greater([1,3,5,7],3)

# or array = [1, 3, 5, 7]
# y = 3
# count = 0
# array.each{ |num| count+=1 if num > y }
# puts count


#Square the values
# Given any array x, say [1, 5, 10, -2], create an algorithm (sets of instructions) that multiplies each value in the array by itself. When the program is done, the array x should have values that have been squared, say [1, 25, 100, 4].
# def squared x
#     x.each { |i| puts i*i }
# end
# squared [1,5,10,-2]


#Eliminate Negative Numbers
#Given any array x, say [1, 5, 10, -2], create an algorithm that replaces any negative number with the value of 0. When the program is done, x should have no negative values, say [1, 5, 10, 0].
# def elimneg x
#     x.each { |i| if i > 0 then puts i else puts 0 end}
# end
# elimneg [1,5,10,-2]

#or arr = [1, 5, 10, -2].each { |num| if num > 0 then puts num else puts 0 end}

# Max, Min, and Average
# Given any array x, say [1, 5, 10, -2], create an algorithm that returns a hash with the maximum number in the array, the minimum value in the array, and the average of the values in the array.
# arr = [1, 5, 10, -2]
# puts arr.max
# puts arr.min
# puts arr.inject(:+) / arr.length


# Shifting the Values in the Array
# Given any array x, say [1, 5, 10, 7, -2], create an algorithm that shifts each number by one to the front. For example, when the program is done, an x of [1, 5, 10, 7, -2] should become [5, 10, 7, -2, 0].
# x = [1, 2, 3, 4]
# count = 0
# x.each { x[count] = x[count+=1]}
# x[x.length-1] = 0
# puts x

# x.shift
# x.push(0)
# puts x

# x.rotate!(1)[x.count-1]=0
# puts x

# Number to string 
# Write a program that takes an array of numbers and replaces any negative number with the string 'Dojo'.  For example, if array x is initially [-1, -3, 2] after your program is done that array should be ['Dojo', 'Dojo', 2].
# arr = [-1, -3, 2]
# arr.each {|i| if i < 0 then puts 'Dojo' else puts i end}
#puts arr.each_index {|i| arr[i] = "Dojo" if arr[i] < 0}
#puts arr

#puts arr.map! {|i| if i < 0 then "Dojo" else i end}
# puts arr.map! {|i| i < 0 ? "Dojo" : i }
# print arr.map! {|i| i < 0 ? "Dojo" : i }
