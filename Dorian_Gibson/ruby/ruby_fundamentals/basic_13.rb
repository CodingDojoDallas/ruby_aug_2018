#Print 1-255
(1..255).each{|x| puts x}

#Print odd numbers between 1-255
(1..255).step(2){|x| puts x}

#Print Sum
sum = 0 
for i in 0..255
    sum += i
    puts "New number: #{i} Sum: #{sum}"
end

#Iterating through an arr
def printEach x
    x.each{|z| puts z}
end
printEach [1,3,5,7,9,13]
printEach [3,4,7,5,1,8,0,3]

#Find Max
def findMax arr
    puts arr.max
end
findMax [1,3,5,7,9,13]
findMax [3,4,7,5,1,8,0,3]

#Get Average
def getAverage arr
    puts arr.reduce(:+)/arr.length
end
getAverage [1,3,5,7,9,13]
getAverage [3,4,7,5,1,8,0,3]

#Array with Odd Numbers
def oddNums
    y = []
    (1..255).step(2){|x| y.push(x)}
    print y
end
oddNums

#Greater than Y
def greaterY arr, y=3
    i = 0
    arr.each{|x| i+=1 if x > y}
    puts i
end
greaterY [1,3,5,7,9,13]
greaterY [1,3,5,7,9,13], 8

#Square the values
def squareVals arr
    arr.each_index{|x| arr[x]=arr[x]*arr[x]}
    print arr
end
squareVals [1,5,10,-2]

#Eliminate Negative Numbers
def elimNeg arr
    arr.select!{|i| i>0}
    puts arr
end
elimNeg [1,36,-33,5,10,-2]

#Max, Min, Average
def calc arr
    puts arr.max, arr.min, arr.reduce(:+)/arr.length
end
calc [1,5,10,-2]

#Shifting the Values in the Array
def shiftArr arr
    arr.shift
    print arr.push(0)
end
shiftArr [1,5,10,-2]

#Number to String
def numString arr
    arr.each_index{|i| arr[i] = 'Dojo' if arr[i] < 0}
    puts arr
end
numString [1,36,-33,5,10,-2]