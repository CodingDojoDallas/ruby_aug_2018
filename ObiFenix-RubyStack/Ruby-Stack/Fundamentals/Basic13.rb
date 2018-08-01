# ====================
# Assignment: Basic 13
# ====================

# Print all numbers from 1 to 255
# -------------------------------
# print (1..255).collect { |i| i }
# print (1..255).map     { |i| i }
# --------------------------------


# Print odd numbers between 1 to 255
# ----------------------------------
# print (1..255).find_all { |num| num.odd? }
# print (1..255).select   { |num| num.odd? }
# (1..255).steps(2)       { |x| puts x}
# -------------------------------------


# Print sum from 0 to 255
# -----------------------
# sum = 0
# x = (0..255)
# puts x.map {|x| "New number: #{x} Sum: #{sum += x}" }
# -----------------------------------------------------


# Iterating through an array
# --------------------------
# <>  Given:     an array X, say [1,3,5,7,9,13],
# <>  Objective: Write a program that would iterate through each member of
#                the array and print each value on the screen.
# <>  Result:
# -----------
# X = [1,3,5,7,9,13]
# X.each {|x| puts x }
# --------------------


# Find Max
# --------
# x = [-5,2,-7,0,1]
# puts x.max
# -----------------


# Get Average
# -----------
# x = [-5,2,-7,0,1]
# len = x.length
# total = x.inject(:+)
# puts avg=total/len
# --------------------


# Array with Odd Numbers
# ----------------------
# <> Given an array ranging from 1 to 225
# <> Objective:
#      o  To write a program that creates an array 'y' capable of containing all the odd numbers within that range.
#      o  After successfuly run/complied , this program shall have to the required 'odd values' be stored in 'y'
#         Example: [1, 3, 5, 7, ... 255].
#
# <> Result:
# -----------
# print y = (1..255).find_all { |i|  i % 2 != 0 }
# print y = (1..255).select { |i| i.odd? }
# ----------------------------------------


# Greater Than Y
# --------------
# <> Required: Write a program that
#      o  Takes in an array
#      o  Rturns the number of values greater than a given value y.
#         For example:
#            if array = [1, 3, 5, 7] and y = 3,
#            then the program shall print 2 (since there are two values in the array that are greater than 3).
# <> Result
# ----------
# => [ Version #1 ]
#    def greater(array, y)
#        x = array.count { |i| i > y }
#        puts x
#    end
#    greater([1,3,5,7],3)
#
# => [ Version #2 ]
#    array = [1, 3, 5, 7]
#    y = 3
#    count = 0
#    array.each{ |num| count+=1 if num > y }
#    puts count
# ---------------------------------------


# Square the values
# -----------------
# Given any array x, say [1, 5, 10, -2], create an algorithm (sets of instructions) that multiplies each value in the array by itself. When the program is done, the array x should have values that have been squared, say [1, 25, 100, 4].
# def squared x
#     x.each { |i| puts i*i }
# end
# squared [1,5,10,-2]
# -------------------


# Eliminate Negative Numbers
# --------------------------
# <> Given: any array x, say [1, 5, 10, -2]
# <> Required:
#     o  create an algorithm that replaces any negative number with the value of 0.
#     o  x should have no negative values after runnung the program
#        example output  =>  [1, 5, 10, 0].
#
# <> Result:
# -----------------
# => [ Version #1 ]
#    def elimneg x
#        x.each { |i| if i > 0 then puts i else puts 0 end}
#    end
#    elimneg [1,5,10,-2]
#
# => [ Version #2 ]
#    arr = [1, 5, 10, -2].each { |num| if num > 0 then puts num else puts 0 end}
# ---------------------------------------


# Max, Min, and Average
# ---------------------
# <> Given: any array x, say [1, 5, 10, -2]
# <> Required: create an algorithm that returns a hash with
#     o  the maximum number in the array
#     o  the minimum value in the array
#     o  the average of the values in the array.
#
# <> Result:
# -----------
# arr = [1, 5, 10, -2]
# puts arr.max
# puts arr.min
# puts arr.inject(:+) / arr.length
# --------------------------------


# Shifting the Values in the Array
# --------------------------------
# <> Given: any array x, say [1, 5, 10, 7, -2]
# <> Required:
#     o  create an algorithm that shifts each number by one to the front.
#     o  For example, x of [1, 5, 10, 7, -2] should become [5, 10, 7, -2, 0].
#
# <> Result:
# ----------------
# => [ Version #1 ]
#    x = [1, 2, 3, 4]
#    count = 0
#    x.each { x[count] = x[count+=1]}
#    x[x.length-1] = 0
#    puts x
#
# => [ Version #2 ]
#    x.shift
#    x.push(0)
#    puts x
#
# => [ Version #3 ]
#    x.rotate!(1)[x.count-1]=0
#    puts x
# ----------------------------


# Number to string
# ----------------
# <> Given: any array, say arr = [-1, -3, 2]
# <> Required:
#     o  write a program that takes an array of numbers
#     o  replaces any negative number with the string 'Dojo'.
#          Example Test => if array x is initially [-1, -3, 2] thenarray should be ['Dojo', 'Dojo', 2].
#
# <> Result:
# -----------
# => [ Version #1 ]
#    arr = [-1, -3, 2]
#    arr.each            {|i| if i < 0 then puts 'Dojo' else puts i end } # dont modify arr but print
#    puts arr.each_index {|i| arr[i] = "Dojo" if arr[i] < 0 } # modify arr and print

# => [ Version #2 ]
#    print arr.map! {|elem| if elem < 0 then "Dojo" else elem end }
#    puts arr.map! {|elem| elem < 0 ? "Dojo" : elem }
# ---------------------------------------------------
